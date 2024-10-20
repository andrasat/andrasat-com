#!/bin/bash

mkdir -v -m 700 $HOME/.ssh
ssh-keyscan -H $SSH_HOST > $HOME/.ssh/known_hosts
echo "$KEY" > $HOME/.ssh/id_rsa
chmod 400 $HOME/.ssh/id_rsa