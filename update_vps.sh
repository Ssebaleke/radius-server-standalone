#!/bin/bash
# Update RADIUS deployment on VPS

echo "🔄 Updating RADIUS server on VPS..."

# Upload updated files
scp .env radius/settings.py root@68.168.222.37:/root/SpotPay/radius-system/
scp radius/settings.py root@68.168.222.37:/root/SpotPay/radius-system/radius/

# Restart services on VPS
ssh root@68.168.222.37 "cd /root/SpotPay/radius-system && docker-compose restart radius-web"

echo "✅ RADIUS server updated!"
echo "🌐 Access admin at: http://68.168.222.37:8082/admin/"
echo "🔑 Login: root / abc111"