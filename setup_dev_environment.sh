#!/bin/sh

# This script installs zsh shell and tldr
# More info on tldr -> https://github.com/tldr-pages/tldr
# More info on ohmyzsh -> https://github.com/ohmyzsh/ohmyzsh


if type "yum" > /dev/null; then
    sudo yum -y update
	sudo yum install -y curl zsh
elif type "dnf" > /dev/null; then
	sudo dnf -y update
	sudo dnf install -y curl zsh
elif type "apt" > /dev/null; then	
	sudo apt update && sudo apt -y upgrade
	sudo apt install -y curl zsh
elif type "pacman" > /dev/null; then	
	sudo pacman -Syu --noconfirm
	sudo pacman -S --noconfirm curl zsh
fi

chsh -s $(which zsh)  # changing default shell
mkdir -p ~/bin &&
curl -o ~/bin/tldr https://raw.githubusercontent.com/raylee/tldr/master/tldr  # installing tldr
chmod +x ~/bin/tldr
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"  # installing ohmyzsh, no need to set as zsh as default as it has been already set
zsh
sed -i '2 s/^# //' ~/.zshrc  # uncomment 2nd line
echo 'x="exit"' >> ~/.zshrc
source ~/.zshrc
complete -W "$(tldr 2>/dev/null --list)" tldr  # autocomplete for tldr
sed -i 's/plugins=(git)/plugins=(git autopep8 python)/' ~/.zshrc  # adding plugins
echo "Installed zsh and tldr, reload or logout to activate changes"

