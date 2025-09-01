FROM tiredofit/freescout:latest

# Copy custom modules and set permissions in one step
COPY --chown=1000:1000 modules/ /www/html/Modules/

# Set environment variable to ensure nginx listens correctly
ENV NGINX_LISTEN_PORT=80

# Expose port 80
EXPOSE 80

# Remove custom healthcheck - use Railway's default