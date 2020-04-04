#!/bin/bash

sudo apt update
sudo apt install -y git

#Auflösung

touch external_monitor_resolution.sh
echo "xrandr --newmode "1280x1024_60.00"  109.00  1280 1368 1496 1712  1024 1027 1034 1063 -hsync +vsync" > external_monitor_resolution.sh
echo "xrandr --addmode DVI-1 1280x1024_60.00" >> 
sudo chmod 755 external_monitor_resolution.sh
sudo mv external_monitor_resolution.sh /etc/profile.d/external_monitor_resolution.sh
sudo /etc/profile.d/external_monitor_resolution.sh

#####################################################################
# Aussehen: Adapta, Breeze_cursors und Papirus icons, Mod Gnome Bar #
#####################################################################

sudo apt install -y gnome-tweaks 
#sudo apt-add-repository ppa:tista/adapta
sudo apt install papirus-icon-theme adapta-gtk-theme breeze-cursor-theme chrome-gnome-shell
#hier aktivieren: https://extensions.gnome.org/extension/1160/dash-to-panel/
wget -O ~/PanelConfig https://raw.githubusercontent.com/raspberrypi/linux/rpi-3.2.27/arch/arm/configs/bcmrpi_defconfig


# Weitere Icons, Themes
sudo git clone https://github.com/EliverLara/Nordic.git /usr/share/themes/Nordic
sudo git clone https://github.com/zayronxio/Zafiro-icons.git /usr/share/icons/Zafiro
sudo apt-get install arc-theme

mkdir -p ~/themes/icons && cd ~/themes/icons && git clone https://github.com/rolfposchmann/paper-icon-theme.git
cd paper-icon-theme/
sudo apt install -y meson
meson "build" --prefix=/usr
#install to /usr/
sudo ninja -C "build" install
