#!/bin/bash

#add repo archlinuxcn 
echo "[archlinuxcn]\nServer = http://repo.archlinuxcn.org/$arch" | sudo tee /etc/pacman.conf

#packages will be installer
#official and archlinxcn repos
PACKS="i3-gaps polybar xfce4-notifyd \
	flameshot playerctl rofi feh scrot \
    hub xorg-xfd"
#AUR
YAYPACKS="siji-git"

sudo pacman -Syu $PACKS --noconfirm
yay -S $YAYPACKS --noconfirm

#configs move
cp -rv i3 $HOME/.config/
cp -rv polybar $HOME/.config/
cp -rv rofi $HOME/.config
cp -rv ranger $HOME/.config

#Fonts install
mkdir -p $HOME/.local/share/fonts
cp -rv polybar/fonts/* $HOME/.local/share/fonts

hub clone stark/siji
cd siji
./install.sh -d ~/.local/share/fonts

#set whallpaper 
cp -v whallpaper .config
feh --bg-fill ~/.config/whallpaper
