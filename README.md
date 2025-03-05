# FireWall Sentinel 🔥🛡️

FireWall Sentinel is an automated firewall rule auditing & alerting tool that scans your system for unauthorized open ports and sends alerts via Slack/Email when unexpected changes are detected. Ideal for DevOps & Security teams to monitor, prevent, and respond to potential threats.

## 🛠️ Features

- ✅ Automated Firewall Auditing (Checks for unauthorized open ports)
- ✅ Real-time Alerts (Slack & Email notifications)
- ✅ Customizable Rules (Whitelist approved ports in config.env)
- ✅ Scheduled Scans (Run audits via cron jobs)
- ✅ Multi-Cloud & On-Prem Support

## 📂 Project Structure

- 📝 firewall-sentinel/
  - 📄 audit_firewall.sh   # Scans firewall rules & detects unauthorized ports
  - 📄 send_alerts.sh    # Sends Slack/Email alerts
  - 📄 config.env        # Configuration file for allowed ports & alert settings
  - 📄 setup.sh         # Installs dependencies & sets up cron job
  - 📄 README.md        # Project documentation
  - 📄 .gitignore       # Excludes sensitive files

## 💪 Prerequisites

- Linux/macOS (or Git Bash for Windows)
- Firewall management tools installed (iptables / ufw)
- curl for API requests
- SMTP settings (for email alerts)
- Slack Webhook URL (for Slack notifications)

## 🚀 Installation & Setup

1. **Clone the Repository**
   ```sh
   git clone https://github.com/Kirankumarvel/FireWallSentinel.git
   cd firewall-sentinel
   ```

2. **Configure Settings**
   Edit the config.env file with allowed ports, email credentials, and Slack webhook URL.
   ```env
   # Allowed open ports (whitelist)
   ALLOWED_PORTS=(22 80 443)

   # Email settings
   SMTP_SERVER="smtp.example.com"
   SMTP_PORT=587
   EMAIL_USERNAME="your-email@example.com"
   EMAIL_PASSWORD="your-password"

   # Slack webhook URL
   SLACK_WEBHOOK="https://hooks.slack.com/services/your/webhook/url"
   ```

3. **Make Scripts Executable**
   ```sh
   chmod +x audit_firewall.sh send_alerts.sh setup.sh
   ```

4. **Run the Initial Audit**
   ```sh
   ./audit_firewall.sh
   ```

## 📆 Automate with Cron Jobs

To schedule daily audits and alerts at 9 AM, add this to crontab:
```sh
crontab -e
```
Add this line:
```sh
0 9 * * * /path/to/firewall-sentinel/audit_firewall.sh >> /var/log/firewall_audit.log 2>&1
```

## 🔄 How It Works

- `audit_firewall.sh` checks all open ports and compares them against `config.env`.
- If unauthorized ports are found, `send_alerts.sh` triggers Slack & Email alerts.
- Runs daily via cron jobs to ensure ongoing security.

## 🔧 Future Enhancements

- 📢 Integrate with AWS/GCP Security Groups for cloud auditing
- ✅ Implement a Web Dashboard for live monitoring
- 🛡️ Auto-block unauthorized ports upon detection
- 🌐 Multi-platform support (Windows Firewall, etc.)

## 💡 Contribution & Support

Want to contribute? Feel free to submit issues, pull requests, or feature suggestions!

🚀 Protect your servers from unauthorized access with FireWall Sentinel! 🔥🛡️
