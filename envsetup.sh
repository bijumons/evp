#!/bin/bash
if [-d "venv" ]; then
    echo "virtualenv already exists"
else
  virtualenv venv
fi
echo $PWD
source /home/biju/evp/venv/bin/activate
pip install -r requirements.txt
if [-d "logs" ]; then
    echo "logs already exists"
else
  mkdir logs
  touch /home/biju/evp/logs/error.log /home/biju/evp/logs/access.log
fi
sudo chmod -R 777 logs
echo "env setup done"

