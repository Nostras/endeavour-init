#!/bin/sh
git config --global user.name "Thom"
git config --global user.email "Thombog@gmail.com"
sudo yay timeshift grub-btrfs
sudo sed -i 's@/.snapshots@--timeshift-auto@g' /etc/systemd/system/grub-btrfsd.service
# sudo systemctl daemon-reload
sudo systemctl enable grub-btrfsd.service

# sudo dracut-rebuild
# sudo grub-mkconfig -o /boot/grub/grub.cfg
