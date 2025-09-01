# FreeScout Docker Setup

This is a Docker Compose setup for FreeScout - an open source help desk and shared mailbox application.

## Prerequisites

- Docker and Docker Compose installed on your system
- Port 8080 available (or modify the port in docker-compose.yml)

## Quick Start

1. **Configure Environment Variables**
   
   Edit the `.env` file to set your desired configuration:
   ```
   SITE_URL=http://localhost:8080          # Your FreeScout URL
   ADMIN_EMAIL=admin@example.com           # Admin email
   ADMIN_PASS=changeme123!                 # Admin password (change this!)
   DB_PASS=freescout_password              # Database password (change this!)
   DB_ROOT_PASSWORD=root_password_change_me # MySQL root password (change this!)
   ```

2. **Start the Services**
   ```bash
   docker-compose up -d
   ```

3. **Access FreeScout**
   - Open your browser and go to: http://localhost:8080
   - Login with the admin credentials you set in the `.env` file

## Services

- **FreeScout**: The help desk application (port 8080)
- **MariaDB**: Database server (internal)

## Data Persistence

All data is stored in Docker volumes:
- `freescout-data`: Application data and sessions
- `freescout-logs`: Application logs
- `freescout-db`: Database files

## Common Commands

```bash
# Start services
docker-compose up -d

# Stop services
docker-compose down

# View logs
docker-compose logs -f

# View FreeScout logs only
docker-compose logs -f freescout

# Restart services
docker-compose restart

# Remove everything (including volumes)
docker-compose down -v
```

## Production Considerations

1. **SSL/HTTPS**: Use a reverse proxy (nginx, traefik) for SSL termination
2. **Backup**: Regularly backup the Docker volumes, especially `freescout-db`
3. **Security**: Change all default passwords in the `.env` file
4. **Email**: Configure SMTP settings in FreeScout admin panel after installation

## Troubleshooting

- If you can't access the application, check if port 8080 is already in use
- First startup may take a few minutes while FreeScout initializes
- Check logs with `docker-compose logs -f` for any errors

## Update FreeScout

To update to the latest version:
```bash
docker-compose pull
docker-compose up -d
```

## Installing Community Modules

FreeScout supports community modules to extend functionality. Here's how to install them:

1. **Find modules**: Browse available modules at:
   - [Community Modules Wiki](https://github.com/freescout-help-desk/freescout/wiki/Community-Modules)
   - [Awesome FreeScout](https://github.com/avenjamin/awesome-freescout)

2. **Download the module**:
   ```bash
   cd modules
   git clone <module-repository-url>
   ```

3. **Copy module to container**:
   ```bash
   docker cp modules/<ModuleName> freescout:/data/Modules/
   ```

4. **Fix permissions** (important!):
   ```bash
   docker exec freescout chown -R nginx:www-data /data/Modules/<ModuleName>
   ```

5. **Activate in FreeScout**: 
   - Login to FreeScout admin
   - Go to Manage → Modules
   - Activate the installed module

### Example: Installing FreeScoutGPT

```bash
# Download module
cd modules
git clone https://github.com/presswizards/FreeScoutGPT.git

# Copy to container and fix permissions
cd ..
docker cp modules/FreeScoutGPT freescout:/data/Modules/
docker exec freescout chown -R nginx:www-data /data/Modules/FreeScoutGPT
```

### Popular Modules

- **FreeScoutGPT**: ChatGPT integration for AI-powered responses
- **Twilio**: SMS/WhatsApp integration
- **SAML2**: Single Sign-On support
- **Stripe**: Payment processing integration

**Note**: Community modules are third-party developed. Review code and use at your own risk.

## Railway Deployment Status
Updated: MySQL connectivity and Mailgun email service configured for Railway hosting.