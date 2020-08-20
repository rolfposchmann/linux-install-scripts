sudo apt install tilix
sudo update-alternatives --config x-terminal-emulator

 Auswahl      Pfad                             Priorität Status
------------------------------------------------------------
* 0            /usr/bin/gnome-terminal.wrapper   40        automatischer Modus
  1            /usr/bin/gnome-terminal.wrapper   40        manueller Modus
  2            /usr/bin/tilix.wrapper            30        manueller Modus

#evtl für menu eintrag
sudo apt install python-nautilus

sudo apt install zsh curl powerline fonts-powerline
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

which $SHELL
chsh -s $(which zsh)
sudo chsh -s $(which zsh) $(whoami)
echo $SHELL

nano .zshrc
ZSH_THEME="agnoster"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting colorize)
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source $HOME/.bash_aliases

#Tilix fix: https://gnunn1.github.io/tilix-web/manual/vteconfig/
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi



cd /etc/profile.d
sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh

nano $HOME/.bash_aliases
alias ..="cd .."
alias ...="cd ../.."

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

sudo apt-get install dconf-cli uuid-runtime
bash -c  "$(wget -qO- https://git.io/vQgMr)"
# sudo apt-get install python-pygments 
