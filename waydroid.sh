#!/bin/sh

# Waydroid image - weston for x11 compat
yay -S --noconfirm waydroid weston pyclip
# waydroid init -s GAPPS
sudo waydroid init
sudo systemctl start waydroid-container.service

# firewalld
sudo firewall-cmd --zone=trusted --change-interface=waydroid0
sudo firewall-cmd --zone=trusted --add-port=67/udp
sudo firewall-cmd --zone=trusted --add-port=53/udp
sudo firewall-cmd --zone=trusted --add-forward
sudo firewall-cmd --runtime-to-permanent

# casualsnek
git clone https://github.com/casualsnek/waydroid_script
cd waydroid_script
python3 -m venv venv
venv/bin/pip install -r requirements.txt
# sudo venv/bin/python3 main.py
sudo venv/bin/python3 main.py install microg
# sudo venv/bin/python3 main.py install libndk
sudo venv/bin/python3 main.py install libhoudini
sudo venv/bin/python3 main.py hack hidestatusbar
# sudo venv/bin/python3 main.py hack nodataperm