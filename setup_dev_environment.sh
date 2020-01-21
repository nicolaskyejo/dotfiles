#!/bin/sh

# This script installs zsh shell and tldr
# More info on tldr -> https://github.com/tldr-pages/tldr
# More info on ohmyzsh -> https://github.com/ohmyzsh/ohmyzsh


if type "yum" > /dev/null; then
    sudo yum -y update
	sudo yum install -y curl zsh git vim
elif type "dnf" > /dev/null; then
	sudo dnf -y update
	sudo dnf install -y curl zsh git vim
elif type "apt" > /dev/null; then	
	sudo apt update && sudo apt -y upgrade
	sudo apt install -y curl zsh git vim
elif type "pacman" > /dev/null; then	
	sudo pacman -Syu --noconfirm
	sudo pacman -S --noconfirm curl zsh git vim
fi

git config --global user.name "Nicolas Kyejo"
git config --global user.email "nicolaskyejo@users.noreply.github.com"
git config --global core.editor "vim"
chsh -s $(which zsh)  # changing default shell
mkdir -p ~/bin &&
curl -o ~/bin/tldr https://raw.githubusercontent.com/raylee/tldr/master/tldr  # installing tldr
chmod +x ~/bin/tldr
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended # installing ohmyzsh, no need to set as zsh as default as it has been already set
zsh
sed -i '2 s/^# //' ~/.zshrc  # uncomment 2nd line
printf 'x="exit"\nc="clear"\nv="vim"\npdf="pdflatex -interaction=nonstopmode"\nlpdf="lualatex -interaction=nonstopmode"\nxpdf="xelatex -interaction=nonstopmode"\n' >> ~/.zshrc
source ~/.zshrc
complete -W "$(tldr 2>/dev/null --list)" tldr  # autocomplete for tldr
sed -i 's/plugins=(git)/plugins=(git autopep8 python)/' ~/.zshrc  # adding plugins
echo "Installed zsh and tldr, reload or logout to activate changes"

