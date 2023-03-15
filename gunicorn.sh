#!/bin/bash

echo "Enter your password: "
read -s password

echo "$password" | sudo -S python manage.py makemigrations
echo "$password" | sudo -S python manage.py migrate
echo "$password" | sudo -S python manage.py collectstatic --noinput
echo "migrations done"
echo "$password" | sudo -S cp -rf gunicorn.socket /etc/systemd/system/
echo "$password" | sudo -S cp -rf gunicorn.service /etc/systemd/system/
echo "$USER"
echo "$PWD"
echo "$password" | sudo -S systemctl daemon-reload
echo "$password" | sudo -S systemctl start gunicorn
echo "$password" | sudo -S systemctl enable gunicorn
echo "$password" | sudo -S systemctl status gunicorn
echo "gunicorn started"
echo "$password" | sudo -S systemctl restart gunicorn

