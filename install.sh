#!/data/data/com.termux/files/usr/bin/bash

apt update && apt upgrade
apt remove wget

apt install -y wget git coreutils nodejs golang zsh ruby python make vim neo-vim
clear

echo "wget git coreutils nodejs golang zsh ruby vim neo-vim python and make installed successfully!"

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Instal 
pip3 install neovim

if [ -d "$HOME/.termux" ]; then
 mv $HOME/.termux $HOME/.termux.bak
fi

# Install colors 
curl -fsLo $HOME/.termux/colors.properties --create-dirs https://raw.githubusercontent.com/mrbrianhinton/chromebook-config/master/.termux/colors.properties

# Install font
curl -fsLo $HOME/.termux/font.ttf --create-dirs https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-Retina.ttf


git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh --depth 1
cp $HOME/.oh-my-zsh/templates/zshrc.zsh-template $HOME/.zshrc

# Set zsh as default
chsh -s zsh

# Add .bash_profile
curl "https://raw.githubusercontent.com/mrbrianhinton/chromebook-config/master/.termux/.bash_profile" --output "$HOME/.bash_profile"

echo "Profile copied!"

# TODO : Add other important .dotfiles

# Connect termux to internal storage
termux-setup-storage

echo "Building Hugo!"

# Get hugo-build and run
bash -c "$(curl -fsSL https://raw.githubusercontent.com/mrbrianhinton/chromebook-config/master/hugo-build.sh)"

echo "Done!"

exit


