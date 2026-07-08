#!/bin/bash
set -euo pipefail
echo "[$(date)] Configuring UFW..." | tee -a /var/log/deployment.log
sudo ufw --force reset
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow OpenSSH
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw --force enable
sudo ufw status verbose | tee -a /var/log/deployment.log