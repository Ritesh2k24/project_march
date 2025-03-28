# Use the official CentOS Apache HTTP Server image
FROM httpd:latest

# Install required packages.
RUN yum install -y unzip curl && yum clean all

# Set working directory.....
WORKDIR /var/www/html/

# Install required packages
RUN apt-get update && apt-get install -y unzip curl && rm -rf /var/lib/apt/lists/*

# Download and unzip the web content.
RUN curl -o photogenic.zip https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip \
    && unzip photogenic.zip -d /var/www/html/ \
    && rm photogenic.zip

# Expose port 80 for HTTP. Edit the inbound rule for kubernetes instance as well.
EXPOSE 80

# Start Apache HTTP Server
CMD ["httpd", "-D", "FOREGROUND"]
