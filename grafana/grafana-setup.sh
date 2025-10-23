/bin/bash
# Grafana Setup Script
set -e

# SSH into Azure VM (where Grafana is running)
ssh adminuser@<azure-vm-ip>

# Check if Grafana container is running
docker ps

# If not running, start it:
docker run -d -p 3000:3000 --name=grafana \
  -e "GF_SECURITY_ADMIN_PASSWORD=admin123" \
  -v /home/adminuser/grafana/provisioning:/etc/grafana/provisioning \
  grafana/grafana:latest

# Access Grafana at http://<azure-vm-ip>:3000
# Login: admin/admin123 (change password on first login)