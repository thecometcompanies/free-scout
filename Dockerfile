FROM tiredofit/freescout:latest

# Copy custom modules
COPY modules/ /www/html/Modules/

# Set proper permissions (using www-data which exists in the base image)
RUN chown -R www-data:www-data /www/html/Modules/

# Expose port 80
EXPOSE 80