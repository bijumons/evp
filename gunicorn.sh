#!/bin/bash

# Activate the virtual environment
. /venv/bin/activate
cd /home/biju/evp
python manage.py makemigrations
python manage.py migrate
python manage.py collectstatic --noinput
echo "migrations done"
sudo cp -rf gunicorn.socket /etc/systemd/system/
sudo cp -rf gunicorn.service /etc/systemd/system/
echo "$USER"
echo "$PWD"
sudo systemctl demon-reload
sudo systemctl start gunicorn
sudo systemctl enable gunicorn
sudo systemctl status gunicorn
echo "gunicorn started"
sudo systemctl restart gunicorn


