# Use official Apache HTTP Server image (Better alternative to CentOS)
FROM httpd:latest  

# Set working directory
WORKDIR /usr/local/apache2/htdocs/

# Install required packages
RUN apt-get update && apt-get install -y unzip curl && rm -rf /var/lib/apt/lists/*

# Download and unzip the web content
RUN curl -o photogenic.zip https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip \
    && unzip photogenic.zip -d /tmp/ \
    && mv /tmp/*/* . \
    && rm -rf /tmp/* photogenic.zip

# Expose port 80 for HTTP (ensure firewall allows it)
EXPOSE 80

# Start Apache HTTP Server
CMD ["httpd", "-DFOREGROUND"]
