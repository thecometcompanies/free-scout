FROM tiredofit/freescout:latest

# Copy custom modules
COPY modules/ /www/html/Modules/

# Set proper permissions
RUN chown -R freescout:freescout /www/html/Modules/

# Expose port 80
EXPOSE 80