#!/bin/bash
# Installs/updates the systemd unit for the Nuxt (Nitro) server and restarts it
# so each deploy actually serves the freshly copied /var/www/server build.
#
# Runs on the VPS via CI (as root):
#   sudo bash ~/deploy_app.sh
#
# Expects andrasat-nuxt.service (template) in the deploy user's home directory.
set -euo pipefail

SERVICE_NAME="andrasat-nuxt"
UNIT_DEST="/etc/systemd/system/${SERVICE_NAME}.service"

RUN_USER="${SUDO_USER:-root}"
USER_HOME="$(getent passwd "$RUN_USER" | cut -d: -f6)"
UNIT_SRC="${USER_HOME}/${SERVICE_NAME}.service"

if [ ! -f "$UNIT_SRC" ]; then
  echo "ERROR: unit template not found at $UNIT_SRC" >&2
  exit 1
fi

# Resolve the node binary as the deploy user (login shell so nvm-installed
# node is found too), falling back to root's PATH.
NODE_BIN="$(sudo -u "$RUN_USER" bash -lc 'command -v node' 2>/dev/null | tail -1 || true)"
if [ -z "$NODE_BIN" ]; then
  NODE_BIN="$(command -v node || true)"
fi
if [ -z "$NODE_BIN" ]; then
  echo "ERROR: node binary not found for user $RUN_USER or root" >&2
  exit 1
fi
echo "Using node: $NODE_BIN (service user: $RUN_USER)"

RENDERED="$(mktemp)"
trap 'rm -f "$RENDERED"' EXIT
sed -e "s|__NODE_BIN__|$NODE_BIN|" -e "s|__RUN_USER__|$RUN_USER|" "$UNIT_SRC" > "$RENDERED"

if ! cmp -s "$RENDERED" "$UNIT_DEST" 2>/dev/null; then
  echo "Installing $UNIT_DEST"
  cp "$RENDERED" "$UNIT_DEST"
  chmod 644 "$UNIT_DEST"
  systemctl daemon-reload
fi
rm -f "$UNIT_SRC"

# Stop the service, then clear any leftover process still holding port 3000
# (e.g. a manually started node from before this unit existed).
systemctl stop "$SERVICE_NAME" 2>/dev/null || true
LEFTOVER_PIDS="$(ss -tlnpH 'sport = :3000' 2>/dev/null | grep -oP 'pid=\K[0-9]+' | sort -u || true)"
if [ -n "$LEFTOVER_PIDS" ]; then
  echo "Killing leftover process(es) on :3000: $LEFTOVER_PIDS"
  # shellcheck disable=SC2086
  kill $LEFTOVER_PIDS 2>/dev/null || true
  sleep 2
  # shellcheck disable=SC2086
  kill -9 $LEFTOVER_PIDS 2>/dev/null || true
fi

systemctl enable "$SERVICE_NAME" >/dev/null 2>&1 || true
systemctl restart "$SERVICE_NAME"

echo "Waiting for the app to respond on 127.0.0.1:3000..."
for _ in $(seq 1 20); do
  if curl -sf -o /dev/null http://127.0.0.1:3000/; then
    echo "OK: $SERVICE_NAME is up."
    exit 0
  fi
  sleep 1
done

echo "ERROR: app did not respond within 20s. Recent logs:" >&2
journalctl -u "$SERVICE_NAME" --no-pager -n 30 >&2 || true
exit 1
