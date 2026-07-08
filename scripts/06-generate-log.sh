#!/bin/bash
set -euo pipefail
LOGFILE="/var/log/deployment-report.log"
{
    echo "===== Deployment Report: $(date) ====="
    echo "--- Disk usage ---"; df -h /
    echo "--- Memory ---"; free -h
    echo "--- Active services ---"; systemctl list-units --type=service --state=running --no-pager
    echo "--- UFW status ---"; sudo ufw status verbose
    echo "--- Listening ports ---"; sudo ss -tulpn
    echo "======================================"
} | tee -a "$LOGFILE"