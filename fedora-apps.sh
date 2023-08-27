#!bin/bash

# Update all
sudo dnf update
sudo dnf upgrade
# For dual booting
sudo dnf install grub-customizer

# General
sudo dnf install htop corectrl neofetch
sudo dnf install gh neovim
#rpmfusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf groupupdate core

# Rust and Python
printf "\n --Installing Programming Languages-- \n\n"; sleep 3
sudo dnf install rust cargo 
sudo dnf install nodejs 
sudo dnf install python3-pip 

# Setup git
while true; do
printf "\n"
read -p "--Setup GitHub Auth? (yes/no)" yn

case $yn in 
	yes ) echo ok, we will proceed;
    git config --global user.name "Alwaa"
    git config --global user.email "74717334+Alwaa@users.noreply.github.com"
    gh auth login
    break;;
	no ) echo skipping;
    break;;
	* ) echo invalid response;;
esac

done


# Setup neovim
while true; do
printf "\n\n --Download the Hack nerd-font from: \n https://www.nerdfonts.com/font-downloads \n"
read -p "-- Done, and add font (yes/no)" yn

case $yn in 
	yes ) echo ok, we will proceed;
    mkdir -p ~/.local/share/fonts/HackMono
    unzip ~/Downloads/Hack.zip -d ~/.local/share/fonts/HackMono/
    fc-cache -v
    break;;
	no ) echo skipping;
    break;;
	* ) echo invalid response;;
esac

done


while true; do
printf "\n"
read -p " --Setup NvChad? (yes/no)" yn

case $yn in 
	yes ) echo ok, we will proceed;

    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

    printf "--Remember to not choose a custom config\n -Then exit"
    sleep 5

    nvim

    mv ~/.config/nvim/lua/custom ~/.config/nvim/lua/custom-backup
    git clone https://github.com/Alwaa/nvchad-custom.git ~/.config/nvim/lua/custom
    
    printf "\n --In Nvim, run 'MasonInstallAll' and 'NvChadUpdate'\n"
    sleep 8
    nvim
    break;;
	no ) echo continuing...;
    break;;
	* ) echo invalid response;;
esac

done

# Basic folder structure
printf "\n --Seting up folders--\n\n"
mkdir -p ~/ugit
mkdir -p ~/wgit
mkdir -p ~/zwin

# Setting up bash aliasse
printf "\n --Setting up Aliases-- \n\n"

aliasesArr=(
'alias gobs="cd ~/Documents/obsidian && ls"'
'alias obsgit="git pull && git status && git add . && git commit -m \"Update\" && git push"'
'alias gits="git status"'
'alias gitac="git add . && git commit -m "'
'alias gitc="git commit -m"'
)

FILE=~/.bashrc
for LINE in "${aliasesArr[@]}"
do
  grep -qF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
  printf "$LINE"
  printf "\n"
done

source ~/.bashrc
#alias -p
sleep 8

## Apps ##
printf "\n --Installing Apps-- \n\n"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

sudo dnf install fedora-workstation-repositories
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install google-chrome-stable

#Windows compatibility layer
# FOR FEDORA 38
sudo dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/38/winehq.repo
sudo sudo dnf install winehq-stable


flatpak install flathub org.gnome.Reversi # Why not
flatpak install flathub org.kde.krita
flatpak install flathub org.audacityteam.Audacity
flatpak install flathub com.discordapp.Discord
flatpak install flathub com.valvesoftware.Steam

printf "\n --Turn off run in background in app settings for:\n Steam\n\n"
printf "\n --Maybe steam-devices needed for controller support\n\n"
sleep 10


flatpak install flathub md.obsidian.Obsidian
mkdir -p ~/Documents/obsidian/

printf "\n --Setup Minimal Theme \n Fetch git repositories in '~/Documents/obsidian/ (alias gobs)'\n\n"
sleep 5

printf "\n --If needed, Install Nvidia drivers through: \n https://rpmfusion.org/Howto/NVIDIA\n\n"

sleep 10
neofetch
sleep 2
