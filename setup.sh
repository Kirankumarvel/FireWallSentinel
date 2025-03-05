#!/bin/bash

# Install dependencies (Net-tools for netstat, Sendmail for email alerts, Curl for Slack)
sudo apt update && sudo apt install -y net-tools sendmail curl

# Set up cron job to run every hour
(crontab -l ; echo "0 * * * * $(pwd)/audit_firewall.sh") | crontab -

echo "Setup complete. Firewall Sentinel is now monitoring unauthorized ports!"
