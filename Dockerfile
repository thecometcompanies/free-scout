FROM tiredofit/freescout:latest

# Install Mailgun packages for Railway HTTPS API
RUN composer require symfony/mailgun-mailer symfony/http-client --no-interaction

# Copy custom modules to the correct location for tiredofit image
COPY --chown=1000:1000 modules/ /data/Modules/

# Also copy to the html location as backup
COPY --chown=1000:1000 modules/ /www/html/Modules/

# Set Railway port environment variable
ENV PORT=80
ENV NGINX_LISTEN_PORT=80

# Expose port 80
EXPOSE 80