#!/bin/bash

sudo cp -rf app.conf /etc/nginx/sites-available/evp
chmod 710 /var/lib/jenkins/evp

sudo ln -s /etc/nginx/sites-available/evp /etc/nginx/sites-enabled
sudo nginx -t

sudo systemctl start nginx
sudo systemctl enable nginx

echo "Nginx has been started"

sudo systemctl status nginx

#!/bin/bash

# Install Nginx
sudo apt-get update
sudo apt-get install nginx

# Stop Nginx if it's already running
sudo service nginx stop

# Copy the Nginx configuration file to the appropriate directory
sudo cp ./nginx.conf /etc/nginx/sites-available/evp

# Check if the symbolic link already exists before creating one
if [ ! -f /etc/nginx/sites-enabled/evp ]; then
    sudo ln -s /etc/nginx/sites-available/evp /etc/nginx/sites-enabled/
fi

# Start Nginx
sudo service nginx start

