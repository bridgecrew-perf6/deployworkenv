#!/bin/bash
sudo pacman -S cronie --noconfirm
sudo systemctl enable --now cronie

git clone https://aur.archlinux.org/timeshift.git
cd timeshift
makepkg -si