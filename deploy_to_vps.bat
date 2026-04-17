@echo off
echo 🚀 Deploying RADIUS Server to VPS...

REM Upload radius-system folder to VPS
echo 📤 Uploading RADIUS files to VPS...
scp -r . root@68.168.222.37:/root/SpotPay/radius-system/

REM Make deploy script executable and run it
echo 🏗️ Running deployment on VPS...
ssh root@68.168.222.37 "chmod +x /root/SpotPay/radius-system/deploy_radius.sh && /root/SpotPay/radius-system/deploy_radius.sh"

echo ✅ RADIUS deployment complete!
echo.
echo 🌐 Your RADIUS server is now available at:
echo    - Auth: 68.168.222.37:1812 (UDP)
echo    - Acct: 68.168.222.37:1813 (UDP)
echo    - Web: http://68.168.222.37:8081
echo.
pause