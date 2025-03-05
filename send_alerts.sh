#!/bin/bash

# Load configuration
source config.env

UNAUTHORIZED_PORTS=$@

# Send email alert
echo -e "Subject: [ALERT] Unauthorized Open Ports Detected\n\nPorts: $UNAUTHORIZED_PORTS" | sendmail -v "$EMAIL_RECIPIENT"

# Send Slack alert
curl -X POST -H 'Content-type: application/json' --data "{'text': '🚨 *Firewall Alert* 🚨\nUnauthorized Open Ports: $UNAUTHORIZED_PORTS'}" "$SLACK_WEBHOOK_URL"

echo "Alerts sent successfully."
