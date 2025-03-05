#!/bin/bash

# Load configuration
source config.env

# Get open ports
OPEN_PORTS=$(netstat -tulnp | grep LISTEN | awk '{print $4}' | awk -F: '{print $NF}' | sort -n | uniq)

# Compare open ports with allowed ports
UNAUTHORIZED_PORTS=()
for PORT in $OPEN_PORTS; do
    if ! grep -q "$PORT" <<< "$ALLOWED_PORTS"; then
        UNAUTHORIZED_PORTS+=("$PORT")
    fi
done

# If unauthorized ports found, trigger alert
if [ ${#UNAUTHORIZED_PORTS[@]} -gt 0 ]; then
    echo "Unauthorized ports detected: ${UNAUTHORIZED_PORTS[@]}" | tee -a firewall_alerts.log
    ./send_alerts.sh "${UNAUTHORIZED_PORTS[@]}"
else
    echo "All ports are authorized. No alerts triggered."
fi
