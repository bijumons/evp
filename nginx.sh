#!/bin/bash

# Install Nginx
sudo apt-get update
sudo apt-get install nginx

# Stop Nginx if it's already running
sudo service nginx stop

# Copy the Nginx configuration file to the appropriate directory
sudo cp nginx.conf /etc/nginx/sites-available/evp

# Create a symbolic link to enable the configuration file
sudo ln -s /etc/nginx/sites-available/evp /etc/nginx/sites-enabled/

# Start Nginx
sudo service nginx start
