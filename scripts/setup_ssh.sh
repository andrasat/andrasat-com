#!/bin/bash
# Configures the `vps` SSH alias for CI. Authentication is handled by
# Tailscale SSH (tailnet identity of the tag:ci runner), so no private key
# is needed; the tailnet policy decides which user the runner may log in as.
set -euo pipefail

umask 077

mkdir -p -m 700 "$HOME/.ssh"

# Pin host key from GitHub Secret to prevent MITM on first connect.
# Set SSH_HOST_KEY to the output of: ssh-keyscan -t ed25519 <host>
if [ -n "$SSH_HOST_KEY" ]; then
  printf '%s\n' "$SSH_HOST_KEY" > "$HOME/.ssh/known_hosts"
else
  echo 'WARNING: SSH_HOST_KEY not set, falling back to trust-on-first-use'
  ssh-keyscan -H "$HOST" >> "$HOME/.ssh/known_hosts" 2>/dev/null
fi

cat > "$HOME/.ssh/config" <<EOF
Host vps
  HostName $HOST
  User $USERNAME
  StrictHostKeyChecking yes
EOF
chmod 600 "$HOME/.ssh/config"
