#!/bin/bash
set -euo pipefail
echo "[$(date)] Enabling core services..." | tee -a /var/log/deployment.log
sudo systemctl enable --now nginx
sudo systemctl enable --now docker
sudo systemctl enable --now fail2ban
echo "[$(date)] Services enabled and started." | tee -a /var/log/deployment.log