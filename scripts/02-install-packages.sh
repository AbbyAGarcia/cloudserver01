#!/bin/bash
set -euo pipefail
PACKAGES="curl wget vim htop ufw fail2ban nginx docker.io docker-compose-plugin unattended-upgrades"
echo "[$(date)] Installing: $PACKAGES" | tee -a /var/log/deployment.log
sudo apt update
sudo apt install -y $PACKAGES
echo "[$(date)] Package installation complete." | tee -a /var/log/deployment.log