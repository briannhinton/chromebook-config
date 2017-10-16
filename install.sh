#!/data/data/com.termux/files/usr/bin/bash

apt update && apt upgrade
apt remove wget

apt install -y wget git coreutils nodejs golang zsh ruby make
clear

echo "wget git coreutils nodejs golang zsh ruby and make installed successfully!"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

echo "Go path successful!"


if [ -d "$HOME/.termux" ]; then
 mv $HOME/.termux $HOME/.termux.bak
fi

# Install colors 
curl -fsLo $HOME/.termux/colors.properties --create-dirs https://raw.githubusercontent.com/mrbrianhinton/chromebook-config/master/.termux/colors.properties

git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh --depth 1
cp $HOME/.oh-my-zsh/templates/zshrc.zsh-template $HOME/.zshrc

# Set zsh as default
chsh -s zsh

# Connect termux to internal storage
termux-setup-storage

echo "Building Hugo!"

# Get hugo-build and run
bash -c "$(curl -fsSL https://raw.githubusercontent.com/mrbrianhinton/chromebook-config/master/hugo-build.sh)"

echo "Done!"

exit


