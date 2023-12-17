#!/bin/sh

#  Personal stuff
# Change taskbar behaviour - KDE specific
sed -i '/panelVisibility/c\panelVisibility=2' /home/thom/.config/plasmashellrc
sed -i '/thickness/c\thickness=36' /home/thom/.config/plasmashellrc
# Change Firefox compact mode -> UI density
echo "user_pref(\"browser.compactmode.show\", \"true\");" >> ~/.mozilla/firefox/*.default/user.js
echo "user_pref(\"browser.uidensity\", \"1\");" >> ~/.mozilla/firefox/*.default/user.js
# Code
yay -S --noconfirm code
cp settings.json '/home/thom/.config/Code - OSS/User/'
# Barrier
yay -S --noconfirm barrier-headless
cp barrierc.desktop '/home/thom/.config/autostart/'

#  Configuring EndeavourOS
# Configure git
git config --global user.name "Thom"
git config -S --noconfirm --global user.email "Thombog@gmail.com"
# Configure backup
yay timeshift grub-btrfs
sudo sed -i 's@/.snapshots@--timeshift-auto@g' /etc/systemd/system/grub-btrfsd.service
sudo systemctl daemon-reload
sudo systemctl enable grub-btrfsd.service
# Install ZEN
yay -S --noconfirm linux-zen linux-zen-headers
yay -R --noconfirm linux linux-headers
sudo dracut-rebuild
sudo grub-mkconfig -o /boot/grub/grub.cfg