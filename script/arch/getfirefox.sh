#!/bin/bash
sudo pacman -S firefox --noconfirm
echo "Add Addons (Y/n)?:"
echo "- Dark Reader"
echo "- decentraleyes"
echo "- uBlock Origin"
read r
[[ "$r" =~ ^(y|Y|)$ ]] &&
    sudo pacman -S firefox-dark-reader firefox-decentraleyes firefox-ublock-origin --noconfirm