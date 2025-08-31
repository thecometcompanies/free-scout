# Railway Deployment Guide for FreeScout

## Step 1: Create Railway Project
1. Go to [railway.app](https://railway.app)
2. Click "Start a New Project"
3. Choose "Deploy from GitHub repo"
4. Select your freescout-docker repository

## Step 2: Add MySQL Database
1. In Railway dashboard, click "New Service"
2. Select "Database" → "MySQL"
3. Note the connection details provided

## Step 3: Configure Environment Variables
In Railway, go to your app service → Variables tab and add:

### Required Variables:
```
SITE_URL=https://your-app-name.railway.app
ADMIN_EMAIL=admin@dtlaprint.com
ADMIN_PASS=YourSecurePassword123!
ADMIN_FIRST_NAME=Admin
ADMIN_LAST_NAME=User
TIMEZONE=America/Los_Angeles

# Database (use values from Railway MySQL service)
DB_TYPE=mysql
DB_NAME=railway
DB_USER=root
DB_PASS=[MySQL password from Railway]
DB_HOST=[MySQL host from Railway]
DB_PORT=3306

# Production Settings
ENABLE_SSL_PROXY=true
DISPLAY_ERRORS=false
LOG_LEVEL=notice
```

## Step 4: Deploy
1. Railway will automatically deploy from your Dockerfile
2. Wait for deployment to complete
3. Check logs for any errors

## Step 5: Set up Custom Domain
1. In Railway dashboard → Settings → Domains
2. Add custom domain: `email.dtlaprint.com`
3. Update your DNS records as shown
4. Update SITE_URL variable to: `https://email.dtlaprint.com`

## Troubleshooting
- Check Railway logs for deployment errors
- Verify all environment variables are set
- Ensure MySQL service is running
- Test database connection

## Updating
Push changes to GitHub and Railway will auto-deploy.