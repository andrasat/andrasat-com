#!/usr/bin/env bash
set -euo pipefail

# ──────────────────────────────────────────────────────────────────────
# nginx_migrate.sh
# Migrate repo-managed nginx virtual host onto VPS with safety checks.
#
# Usage:
#   ./nginx_migrate.sh [OPTIONS]
#
# Options:
#   --config <file>     Path to nginx site config (default: configs/nginx/andrasat.com.conf)
#   --disable-default   Remove /etc/nginx/sites-enabled/default after migration
#   --dry-run           Validate everything but don't apply changes
#   --help              Show this message
#
# Expected to be run on the VPS (or via doctl compute ssh / remote SSH).
# Requires: nginx, certbot (optional), systemctl.
# ──────────────────────────────────────────────────────────────────────

SITE_CONFIG="configs/nginx/andrasat.com.conf"
DISABLE_DEFAULT=false
DRY_RUN=false

usage() {
  sed -n '/^# Usage:/,/^# ─/p' "$0" | sed 's/^# //'
  exit 0
}

for arg in "$@"; do
  case $arg in
    --config)
      SITE_CONFIG="${2:-}"
      shift 2
      ;;
    --disable-default)
      DISABLE_DEFAULT=true
      shift
      ;;
    --dry-run)
      DRY_RUN=true
      shift
      ;;
    --help)
      usage
      ;;
    *)
      echo "Unknown option: $arg"
      usage
      ;;
  esac
done

# ──────────────────────────────────────────────────
# Helpers
# ──────────────────────────────────────────────────
dry() {
  if $DRY_RUN; then
    echo "[DRY-RUN]" "$@"
  else
    eval "$@"
  fi
}

step() {
  echo "▶  $*"
}

# ──────────────────────────────────────────────────
# Pre-flight checks
# ──────────────────────────────────────────────────
step "Pre-flight checks"

if [ ! -f "$SITE_CONFIG" ]; then
  echo "ERROR: config file not found: $SITE_CONFIG" >&2
  exit 1
fi

# Extract upstream port from config so we can warn if it's unreachable
UPSTREAM_PORT=$(awk '/^[[:space:]]*server[[:space:]]/ && /127\.0\.0\.1/{print $2; exit}' "$SITE_CONFIG")

if [ -z "$UPSTREAM_PORT" ]; then
  echo "WARNING: Could not determine upstream port from config. Skipping connectivity check."
else
  if ! curl -s -o /dev/null -w '' "http://${UPSTREAM_PORT}" --connect-timeout 3; then
    echo "WARNING: upstream ${UPSTREAM_PORT} not reachable — nginx will start but site may return 502."
  else
    echo "OK: upstream ${UPSTREAM_PORT} reachable"
  fi
fi

# ──────────────────────────────────────────────────
# Certificate readiness
# ──────────────────────────────────────────────────
step "Checking certificate"

CERT_PATH=$(awk '/^[[:space:]]*ssl_certificate /{gsub(";","",$2); print $2; exit}' "$SITE_CONFIG")

if [ -z "$CERT_PATH" ]; then
  echo "ERROR: Could not determine ssl_certificate path from $SITE_CONFIG" >&2
  exit 1
fi

if [ -f "$CERT_PATH" ]; then
  echo "OK: certificate found at $CERT_PATH"
else
  echo "NOTICE: certificate not yet issued at $CERT_PATH."

  if command -v certbot &>/dev/null; then
    DOMAINS=$(awk '
      /^[[:space:]]*server_name /{found=1; gsub(";",""); for(i=2;i<=NF;i++) print $i}
    ' "$SITE_CONFIG" | sort -u | tr '\n' ' ')

    if [ -n "$DOMAINS" ]; then
      echo "Will attempt certbot for: $DOMAINS"

      # Build -d flags
      CERT_D_FLAGS=""
      for d in $DOMAINS; do
        CERT_D_FLAGS="$CERT_D_FLAGS -d $d"
      done

      if $DRY_RUN; then
        echo "[DRY-RUN] certbot --nginx $CERT_D_FLAGS --non-interactive --agree-tos --email admin@andrasat.com"
      else
        step "Running certbot..."
        certbot --nginx $CERT_D_FLAGS --non-interactive --agree-tos --email admin@andrasat.com
      fi
    else
      echo "ERROR: Could not extract domain names. Please run certbot manually." >&2
      exit 1
    fi
  else
    echo "ERROR: certbot not installed and certificate missing." >&2
    exit 1
  fi
fi

# ──────────────────────────────────────────────────
# Install site config
# ──────────────────────────────────────────────────
step "Installing site config"

SITE_NAME=$(basename "$SITE_CONFIG")
AVAILABLE="/etc/nginx/sites-available/$SITE_NAME"
ENABLED="/etc/nginx/sites-enabled/$SITE_NAME"

dry cp "$SITE_CONFIG" "$AVAILABLE"

if [ -L "$ENABLED" ] || [ -e "$ENABLED" ]; then
  echo "OK: $ENABLED already exists"
else
  dry ln -s "$AVAILABLE" "$ENABLED"
  echo "OK: symlink created: $ENABLED -> $AVAILABLE"
fi

# ──────────────────────────────────────────────────
# Test + reload
# ──────────────────────────────────────────────────
step "Testing nginx configuration"

if ! $DRY_RUN; then
  nginx -t
fi

step "Reloading nginx"
dry systemctl reload nginx

# ──────────────────────────────────────────────────
# Optionally disable default site
# ──────────────────────────────────────────────────
if $DISABLE_DEFAULT; then
  step "Disabling default site"
  DEFAULT_FILE="/etc/nginx/sites-enabled/default"

  if [ -e "$DEFAULT_FILE" ]; then
    dry rm "$DEFAULT_FILE"
    echo "OK: removed $DEFAULT_FILE"

    step "Retesting nginx after default removal"
    if ! $DRY_RUN; then
      nginx -t
    fi
    dry systemctl reload nginx
  else
    echo "OK: default site was already removed"
  fi
fi

# ──────────────────────────────────────────────────
# Summary
# ──────────────────────────────────────────────────
if $DRY_RUN; then
  echo ""
  echo "═══════════════════════════════════════════"
  echo " DRY-RUN complete. No changes were made."
  echo " Run without --dry-run to apply."
  echo "═══════════════════════════════════════════"
else
  echo ""
  echo "═══════════════════════════════════════════"
  echo " Migration complete."
  echo " Verify: https://andrasat.com"
  echo "         https://legal.andrasat.com/privacy-policy"
  echo "═══════════════════════════════════════════"
fi
