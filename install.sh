#!/data/data/com.termux/files/usr/bin/bash

apt update && apt upgrade

apt install wget
apt install git

mkdir ~/dotfiles
cd ~/dotfiles # enter the new dotfiles directory
git init

# install all the core tools that you need
apt install -y coreutils make clang nodejs zsh ruby ruby-dev tmux vim python python-dev neovim libsqlite-dev libxslt-dev pkg-config

# install rails
gem install nokogiri -- --use-system-libraries
gem install rails

# creating the config files
touch zshrc tmux.conf vimrc 

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

# Connect termux to internal storage
termux-setup-storage

# Set zsh as default
chsh -s zsh

exit


