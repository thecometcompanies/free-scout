FROM tiredofit/freescout:latest

# Copy custom modules and set permissions in one step
COPY --chown=1000:1000 modules/ /www/html/Modules/

# Expose port 80
EXPOSE 80