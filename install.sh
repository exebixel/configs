#!/bin/bash

PACKS="i3-gaps polybar xfce4-notifyd \
	flameshot playerctl rofi feh"
YAYPACKS="siji-git"

echo $HOME
sudo pacman -Syu $PACKS --noconfirm
yay -S $YAYPACKS--noconfirm

cp -rv i3 $HOME/.config/
cp -rv polybar $HOME/.config/
cp -rv rofi $HOME/.config
