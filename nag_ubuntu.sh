#!/bin/bash

sudo apt update
sudo apt install -y curl wget git

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
