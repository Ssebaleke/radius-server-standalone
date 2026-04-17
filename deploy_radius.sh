#!/bin/bash
# RADIUS Server Deployment Script for VPS
# Run this on your VPS at 68.168.222.37

echo "🚀 Deploying SpotPay RADIUS Server..."

# Navigate to radius-system directory
cd /root/SpotPay/radius-system || {
    echo "❌ Error: /root/SpotPay/radius-system directory not found"
    echo "Please upload the radius-system folder to your VPS first"
    exit 1
}

# Check if .env file exists
if [ ! -f .env ]; then
    echo "❌ Error: .env file not found"
    echo "Please upload the .env file to the radius-system directory"
    exit 1
fi

# Stop any existing containers
echo "🛑 Stopping existing RADIUS containers..."
docker-compose down

# Pull latest images
echo "📥 Pulling Docker images..."
docker-compose pull

# Build and start containers
echo "🏗️ Building and starting RADIUS containers..."
docker-compose up -d --build

# Wait for containers to start
echo "⏳ Waiting for containers to initialize..."
sleep 10

# Check container status
echo "📊 Container Status:"
docker-compose ps

# Check if RADIUS ports are listening
echo "🔍 Checking RADIUS ports:"
netstat -ulnp | grep -E ":(1812|1813)"

# Show logs
echo "📝 Recent logs:"
docker-compose logs --tail=20

echo "✅ RADIUS Server deployment complete!"
echo ""
echo "🌐 Services available:"
echo "   - RADIUS Auth: 68.168.222.37:1812 (UDP)"
echo "   - RADIUS Acct: 68.168.222.37:1813 (UDP)" 
echo "   - Web Dashboard: http://68.168.222.37:8081"
echo ""
echo "🔧 To check status: docker-compose ps"
echo "📋 To view logs: docker-compose logs -f"