#!/bin/bash

# setup
mkdir git && cd git


# basic packages
sudo pacman -Syu
sudo pacman --noconfirm -S git vim mani feh xrandr flameshot xorg-xbacklight ttf-font-awesome noto-fonts-cjk noto-fonts-emoji noto-fonts fcitx5 fcitx5-configtool fcitx5-mozc fcitx-gtk fcitx-qt alsa-utils firefox neofetch


# yay
git clone https://aur.archlinux.org/yay-git && cd yay-git
makepkg -si --noconfirm


# suckless download
cd ~/git/
git clone https://git.suckless.org/dwm
git clone https://git.suckless.org/slstatus
git clone https://git.suckless.org/st


# personal configs
mkdir ~/.config/dwm

git clone https://github.com/DerAndereJohannes/arch-dwm.git
cp arch-dwm/dwm/.dwm/* ~/.config/dwm/
cp arch-dwm/dwm/*.* dwm/

cp arch-dwm/slstatus/* slstatus/
cp arch-dwm/st/* st/


# dwm setup
cd dwm
patch -i dwm-autostart-202110120-cb3f58a.diff
sudo make clean install
cd ..

# slstatus setup
cd slstatus
sudo make clean install
cd ..

# st setup
cd st
sudo make clean install
cd ..

# create .xinitrc
echo -e "bash ~/.config/dwm/autostart.sh\nINPUT_METHOD=fcitx5\nGTK_IM_MODULE=fcitx5\nQT_IM_MODULE=fcitx5\nXMODIFIERS=@im=fcitx5\nexec dwm" > ~/.xinitrc

# create fcitx5 settings for wayland when I use this
mkdir ~/.config/environment.d/
echo -e "INPUT_METHOD=fcitx5\nGTK_IM_MODULE=fcitx5\nQT_IM_MODULE=fcitx5\nXMODIFIERS=@im=fcitx5" > ~/.config/environment.d/envvars.conf
