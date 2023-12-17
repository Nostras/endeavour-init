#!/bin/sh

#  Personal stuff
# Change taskbar behaviour
sed -i '/panelVisibility/c\panelVisibility=2' /home/thom/.config/plasmashellrc
sed -i '/thickness/c\thickness=36' /home/thom/.config/plasmashellrc
# Firefox compact mode (PLEASE)
echo "user_pref(\"browser.compactmode.show\", \"true\");" >> ~/.mozilla/firefox/*.default/user.js
echo "user_pref(\"browser.uidensity\", \"1\");" >> ~/.mozilla/firefox/*.default/user.js
# Code
yay -S --noconfirm code
cp settings.json '/home/thom/.config/Code - OSS/User/'


# Other niceties
git config --global user.name "Thom"
git config -S --noconfirm --global user.email "Thombog@gmail.com"
yay timeshift grub-btrfs
sudo sed -i 's@/.snapshots@--timeshift-auto@g' /etc/systemd/system/grub-btrfsd.service
# sudo systemctl daemon-reload
sudo systemctl enable grub-btrfsd.service
yay -S --noconfirm linux-zen linux-zen-headers
yay -R --noconfirm linux linux-headers
sudo dracut-rebuild
sudo grub-mkconfig -o /boot/grub/grub.cfg