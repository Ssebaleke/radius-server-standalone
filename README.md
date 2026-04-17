# RADIUS Server - Standalone

Independent RADIUS authentication server for hotspot management.

## Features
- FreeRADIUS server with PostgreSQL backend
- Django web interface for user management
- Docker containerized deployment
- Independent from SpotPay billing system

## Deployment
- Runs on port 8082 (web interface)
- RADIUS ports 1812/1813 (authentication/accounting)
- Uses shared Supabase PostgreSQL database

## Setup
1. Configure `.env` file with database credentials
2. Deploy with `docker-compose up -d`
3. Access admin at http://your-server:8082/admin/