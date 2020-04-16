#Termial

sudo apt-get install -y zsh 
sudo apt install -y fonts-powerline

#Nord theme for console
cd ~
git clone https://github.com/arcticicestudio/nord-gnome-terminal.git
cd nord-gnome-terminal/src
./nord.sh
cd ~

#More color themes for console
#https://github.com/Mayccoll/Gogh
sudo apt-get install -y dconf-cli uuid-runtime
bash -c  "$(wget -qO- https://git.io/vQgMr)"
#-> 33 desert

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#nano ~/.zshrc
#-> ZSH_THEME="agnoster"
#-> plugins=(git bundler osx rake ruby)
