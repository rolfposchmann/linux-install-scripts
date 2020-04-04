#!/bin/bash

sudo apt update
sudo apt install -y curl wget git

#Auflösung

touch external_monitor_resolution.sh
echo "xrandr --newmode "1280x1024_60.00"  109.00  1280 1368 1496 1712  1024 1027 1034 1063 -hsync +vsync" > external_monitor_resolution.sh
echo "xrandr --addmode DVI-1 1280x1024_60.00" >> 
sudo chmod 755 external_monitor_resolution.sh
sudo mv external_monitor_resolution.sh /etc/profile.d/external_monitor_resolution.sh
sudo /etc/profile.d/external_monitor_resolution.sh


#SWAP
#sudo fallocate -l 1G /swapfile
sudo dd if=/dev/zero of=/swapfile bs=1024 count=1048576   #1GB
#sudo dd if=/dev/zero of=/myswap count=4096 bs=1MiB
ls -lh /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
#sudo nano /etc/fstab
#/swapfile                                 none            swap    sw              0       0

#btrfs swap
btrfs filesystem usage /
dmesg | grep crc32c

sudo rm /swapfile
sudo truncate -s 0 /swapfile
sudo chattr +C /swapfile
sudo btrfs property set /swapfile compression none
sudo dd if=/dev/zero of=/swapfile bs=1024 count=1048576 
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
# swapoff /swapfile
# rm -f /swapfile
echo "#/swapfile                                 none            swap    sw                            0       0" | sudo tee -a /etc/fstab


sudo swapon --show
free -h

#cat /proc/sys/vm/swappiness
#sudo nano /etc/sysctl.conf
#add: vm.swappiness=10

#renove swap
#sudo swapoff -v /swapfile
#fstab
#sudo rm /swapfile

####################################
# ZRam

sudo apt-get install zram-config 


##################################
# /tmp on tmpfs

echo "#tmpfs                                     /tmp            tmpfs   rw,nosuid,nodev               0       0" | sudo tee -a /etc/fstab

#####################################################################
# Aussehen: Adapta, Breeze_cursors und Papirus icons, Mod Gnome Bar #
#####################################################################

sudo apt install -y gnome-tweaks 
#sudo apt-add-repository ppa:tista/adapta
sudo apt install papirus-icon-theme adapta-gtk-theme breeze-cursor-theme chrome-gnome-shell
#hier aktivieren: https://extensions.gnome.org/extension/1160/dash-to-panel/
wget https://raw.githubusercontent.com/rolfposchmann/linux-install-scripts/master/files/ConfigRolfBar -O ~/PanelConfig


# Weitere Icons, Themes

#Arc Theme
sudo apt-get install arc-theme
#Nordic Theme
sudo git clone https://github.com/EliverLara/Nordic.git /usr/share/themes/Nordic

#Zafiro icons
sudo git clone https://github.com/zayronxio/Zafiro-icons.git /usr/share/icons/Zafiro

#Numix icons
sudo apt install numix-icon-theme-circle

#Paper icons
mkdir -p ~/themes/icons && cd ~/themes/icons && git clone https://github.com/rolfposchmann/paper-icon-theme.git
cd paper-icon-theme/
sudo apt install -y meson
meson "build" --prefix=/usr
#install to /usr/
sudo ninja -C "build" install

#gedit theme
mkdir -p ~/.local/share/gedit/styles
wget https://raw.githubusercontent.com/rolfposchmann/linux-install-scripts/master/files/material-theme.xml -O ~/.local/share/gedit/styles/material-theme.xml

#Termial

sudo apt-get install -y zsh 
sudo apt install -y fonts-powerline

#Nord theme for console
git clone https://github.com/arcticicestudio/nord-gnome-terminal.git
cd nord-gnome-terminal/src
./nord.sh

#More color themes for console
#https://github.com/Mayccoll/Gogh
sudo apt-get install -y dconf-cli uuid-runtime
bash -c  "$(wget -qO- https://git.io/vQgMr)"
#-> 33 desert

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#nano ~/.zshrc
#-> ZSH_THEME="agnoster"
#-> plugins=(git bundler osx rake ruby)
