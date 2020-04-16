#####################################################################
# Aussehen: Adapta, Breeze_cursors und Papirus icons, Mod Gnome Bar #
#####################################################################

#sudo apt-add-repository ppa:tista/adapta
sudo apt install -y papirus-icon-theme adapta-gtk-theme breeze-cursor-theme chrome-gnome-shell

# PANEL
sudo apt install -y gnome-tweaks 
#hier aktivieren: https://extensions.gnome.org/extension/1160/dash-to-panel/
wget https://raw.githubusercontent.com/rolfposchmann/linux-install-scripts/master/files/ConfigRolfBar -O ~/PanelConfig
#Start Menu
#https://extensions.gnome.org/extension/6/applications-menu/


# Weitere Icons, Themes

#Arc Theme
sudo apt-get install -y arc-theme
#Nordic Theme
sudo git clone https://github.com/EliverLara/Nordic.git /usr/share/themes/Nordic

#Zafiro icons
sudo git clone https://github.com/zayronxio/Zafiro-icons.git /usr/share/icons/Zafiro

#Numix icons
sudo apt install -y numix-icon-theme-circle

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

#Material-dark (mit Numic Circle)
https://github.com/nana-4/materia-theme

#Adapta
sudo apt install adapta-gtk-theme
#Arc Theme
sudo apt-get install -y arc-theme

#CBalckdark

#############################
# Icons

#Nordic Theme
sudo git clone https://github.com/EliverLara/Nordic.git /usr/share/themes/Nordic

#Zafiro icons
sudo git clone https://github.com/zayronxio/Zafiro-icons.git /usr/share/icons/Zafiro

#Numix icons
#sudo add-apt-repository ppa:numix/ppa
#sudo apt update
#sudo apt install numix-icon-theme-circle
sudo apt install -y numix-icon-theme-circle

#paper icons
mkdir -p ~/.icons && cd ~/.icons && git clone https://github.com/rolfposchmann/paper-icon-theme.git
cd ~/.icons/paper-icon-theme/
sudo apt install -y meson
meson "build" --prefix=/usr
#install to /usr/share/icons/Paper
sudo ninja -C "build" install

#vimix-icon-theme
cd ~/.icons && git clone https://github.com/vinceliuice/vimix-icon-theme.git
cd vimix-icon-theme/
./install.sh

#La-capitaine-icon-theme
cd ~/.icons && git clone https://github.com/keeferrourke/la-capitaine-icon-theme.git
cd la-capitaine-icon-theme/
./configure
