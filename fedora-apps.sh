#!bin/bash

# Update all
sudo dnf update
sudo dnf upgrade
# For dual booting
sudo dnf install grub-customizer

# General
sudo dnf install htop gh neovim 

# Setup git
while true; do
read -p "Setup GitHub Auth? (yes/no)" yn

case $yn in 
	yes ) echo ok, we will proceed
    git config --global user.name "Alwaa"
    git config --global user.email "74717334+Alwaa@users.noreply.github.com"

    gh auth login
	no ) echo skipping
    break;;
	* ) echo invalid response;;
esac

done


# Setup neovim
while true; do
read -p "Download the Hack nerd-font from: \n https://www.nerdfonts.com/font-downloads \n Done (yes/no)" yn

case $yn in 
	yes ) echo ok, we will proceed
    mkdir -p ~/.local/share/fonts/HackMono
    unzip ~/Downloads/Hack.zip -d ~/.local/share/fonts/HackMono/
    fc-cache -v;;
	no ) echo skipping
    break;;
	* ) echo invalid response;;
esac

done


while true; do
read -p "Setup NvChad? (yes/no)" yn

case $yn in 
	yes ) echo ok, we will proceed

    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

    echo "Remember to not choose a custom config\n -Then exit"
    sleep 5

    nvim

    mv ~/.config/nvim/lua/custom ~/.config/nvim/lua/custom-backup
    git clone https://github.com/Alwaa/nvchad-custom.git ~/.config/nvim/lua/custom
    nvim;;
	no ) echo continuing...;
    break;;
	* ) echo invalid response;;
esac

done


# Apps
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

sudo dnf install fedora-workstation-repositories
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install google-chrome-stable

flatpak install flathub org.gnome.Reversi # Why not
flatpak install flathub org.kde.krita
flatpak install flathub org.audacityteam.Audacity
flatpak install flathub com.discordapp.Discord
flatpak install flathub com.valvesoftware.Steam

echo "Turn off run in background in app settings for:\n Steam"
echo "Maybe steam-devices needed for controller support"
sleep 10


flatpak install flathub md.obsidian.Obsidian
mkdir -p ~/Documents/obsidian/

echo "Setup Minimal Theme \n Fetch git repositories in '~/Documents/obsidian/'"
sleep 5
