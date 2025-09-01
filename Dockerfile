FROM tiredofit/freescout:latest

# Copy custom modules and set permissions in one step
COPY --chown=1000:1000 modules/ /www/html/Modules/

# Set Railway port environment variable
ENV PORT=80
ENV NGINX_LISTEN_PORT=80

# Expose port 80
EXPOSE 80