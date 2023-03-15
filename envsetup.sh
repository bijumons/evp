#!/bin/bash
if [ -d "venv" ]; then
    echo "virtualenv already exists"
else
  virtualenv venv
fi
echo $PWD
. /var/lib/jenkins/workspace/evp/venv/bin/activate
pip install -r requirements.txt
if [ -d "logs" ]; then
    echo "logs already exists"
else
    mkdir logs
    touch /home/biju/evp/logs/error.log /home/biju/evp/logs/access.log
    chown -R jenkins:jenkins logs
fi
chmod -R 777 logs

