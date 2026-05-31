#!/bin/bash
set -e
mkdir -v -m 700 $HOME/.ssh
ssh-keyscan -H $HOST >> $HOME/.ssh/known_hosts 2>/dev/null

printf '%s\n' "$KEY" | sed 's/\r$//' > /tmp/id_rsa_encrypted
chmod 600 /tmp/id_rsa_encrypted

if [ -n "$SSH_PASSPHRASE" ]; then
  ssh-keygen -p -P "$SSH_PASSPHRASE" -N "" -f /tmp/id_rsa_encrypted
fi

mv /tmp/id_rsa_encrypted $HOME/.ssh/id_rsa
chmod 600 $HOME/.ssh/id_rsa