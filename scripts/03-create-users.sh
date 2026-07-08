#!/bin/bash
set -euo pipefail
USERNAME="${1:-cloudadmin}"

if id "$USERNAME" &>/dev/null; then
    echo "[$(date)] User $USERNAME already exists, skipping." | tee -a /var/log/deployment.log
else
    sudo adduser --disabled-password --gecos "" "$USERNAME"
    sudo usermod -aG sudo "$USERNAME"
    sudo mkdir -p /home/"$USERNAME"/.ssh
    sudo chmod 700 /home/"$USERNAME"/.ssh
    sudo chown -R "$USERNAME":"$USERNAME" /home/"$USERNAME"/.ssh
    echo "[$(date)] Created user $USERNAME with sudo access." | tee -a /var/log/deployment.log
fi