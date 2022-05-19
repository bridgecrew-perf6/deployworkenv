#!/bin/bash

# remember boot selection
sudo sed -i "/GRUB_DEFAULT/ s/=.*/=saved/" /etc/default/grub
sudo sed -i '/GRUB_SAVEDEFAULT/ s/^#//' /etc/default/grub

# reduce to 2 seconds
sudo sed -i "/GRUB_TIMEOUT/ s/=.*/=2/" /etc/default/grub

# use os-prober
sudo pacman -S os-prober
sudo sed -i '/#GRUB_DISABLE_OS_PROBER/ s/^#//' /etc/default/grub

# recommend
read -p 'use "breeze-grub" theme (y/N)?' r
if [[ "$r" =~ ^(y|Y)$ ]]; then
    sudo pacman -S breeze-grub
    sudo cp -r /usr/share/grub/themes/breeze /boot/grub/themes
    echo GRUB_THEME=/boot/grub/themes/breeze/theme.txt | sudo tee -a /etc/default/grub
fi

# apply
sudo grub-mkconfig -o /boot/grub/grub.cfg