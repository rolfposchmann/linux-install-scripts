git clone https://github.com/wmutschl/timeshift-autosnap-apt.git github/timeshift-autosnap-apt
cd timeshift-autosnap-apt/
sudo make install
sudo nano /etc/timeshift-autosnap-apt.conf 
snapshotBoot=false
snapshotEFI=true




git clone https://github.com/Antynea/grub-btrfs.git
cd grub-btrfs/
sudo make install
sudo nano /etc/default/grub-btrfs/config 
GRUB_BTRFS_SUBMENUNAME="Ubuntu snapshots"

#testen
sudo timeshift-autosnap-apt

sudo systemctl enable fstrim.timer
sudo reboot now

sudo apt update
sudo apt upgrade
sudo apt dist-upgrade
sudo apt autoremove
sudo apt autoclean
sudo fwuodmgr get-devices
sudo fwupdmgr get-devices
sudo fwupdmgr get-update
sudo fwupdmgr get-updates
sudo fwupdmgr update
sudo reboot now

nm-connection-editor 

cat /proc/sys/vm/swappiness
sudo apt-get install zram-config 

alsamixer

sudo apt install neofetch htop

git clone https://github.com/vinceliuice/matcha.git matcha-theme
cd matcha-theme/
chmod +x install.sh 
./install.sh

sudo apt install papirus-icon-theme









