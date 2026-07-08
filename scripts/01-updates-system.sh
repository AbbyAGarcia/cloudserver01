#!/bin/bash
set -euo pipefail
echo "[$(date)] Starting system update..." | tee -a /var/log/deployment.log
sudo apt update && sudo apt upgrade -y
sudo apt autoremove -y
echo "[$(date)] System update complete." | tee -a /var/log/deployment.log