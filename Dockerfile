# Use an official PHP image as the base
FROM php:8.0-apache

# Install necessary PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Set the ServerName directive globally
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Copy application code to the web root
COPY /src/. /var/www/html/

# Set permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port 80
EXPOSE 80

# Start the Apache server
CMD ["apache2-foreground"]
