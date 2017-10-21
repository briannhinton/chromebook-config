#!/data/data/com.termux/files/usr/bin/bash

# get current location for later
here=$(pwd)

apt update && apt upgrade
apt remove wget

apt install -y wget git coreutils nodejs 
apt install -y golang zsh gcc ruby python
apt install -y python-dev make vim neovim
clear

echo "wget git coreutils nodejs golang zsh gcc ruby vim neo-vim python and make installed successfully!"

# make a new dotfiles directory
mkdir ~/dotfiles 

# enter the new dotfiles directory
cd ~/dotfiles 

# ready the directory for git version control
git init 

# creating the config files
touch zshrc tmux.conf vimrc 

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Instal 
pip install neovim

# Remove created folders
rm -rf ~/.vim ~/.vimrc ~/.zshrc ~/.tmux ~/.tmux.conf ~/.config/nvim 2> /dev/null

# Make required folders for neo-vim
mkdir -p ~/.config ~/.config/nvim

# Symlink the files
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vimrc ~/.config/nvim/init.vim

cd "${here}"

# Check to see if a .termux folder exists. If it does create a back-up
if [ -d "$HOME/.termux" ]; then
 mv $HOME/.termux $HOME/.termux.bak
fi

# Install colors 
curl -fsLo $HOME/.termux/colors.properties --create-dirs https://raw.githubusercontent.com/mrbrianhinton/chromebook-config/master/.termux/colors.properties

# Install font
curl -fsLo $HOME/.termux/font.ttf --create-dirs https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-Retina.ttf

# Add .bash_profile TODO: Rename
curl "https://raw.githubusercontent.com/mrbrianhinton/chromebook-config/master/.termux/.bash_profile" --output "$HOME/dotfiles/zshrc"

echo "Profile copied!"

# TODO : Add other important .dotfiles

# Connect termux to internal storage
termux-setup-storage

echo "Building Hugo!"

# Get hugo-build and run
bash -c "$(curl -fsSL https://raw.githubusercontent.com/mrbrianhinton/chromebook-config/master/hugo-build.sh)"

echo "Done!"

# Set zsh as default
chsh -s zsh

exit


