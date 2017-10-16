# Termux Config
#### Chrome OS

**Termux Config** is my checklist I follow to set up a new Chromebook's development environment. It gets me up to speed with Git, Node, Ruby, and more so I can more quickly get back to work.

## Contents

| File | Description |
| --- | --- |
| `.gitconfig` | Global Git configuration to specify my name and email, shortcuts, colors, and more. |
| `.gitignore` | The ignore file from [twbs/bootstrap](https://github.com/twbs/bootstrap) that I use everywhere. |

## Checklist

### 1. Install requirements

- Open Termux
- Enter ```bash apt install -y curl``` to install curl

### 2. Installation
- Enter ` bash -c "$(curl -fsSL https://raw.githubusercontent.com/mrbrianhinton/chromebook-config/master/install.sh)"`

install.sh will install:
- A better version of wget
- npm 
- nodejs
- ruby
- coreutils
- golang
- make

Then it will run `termux-storage-setup` to gain access to local storage.

When install.sh is complete it will prompt you that it is done.

TODO: Setup bash-profile, gitconfig, etc. more easily.

### 2. Build and install Hugo

- Enter ` bash -c "$(curl -fsSL https://raw.githubusercontent.com/mrbrianhinton/chromebook-config/master/hugo-build.sh)"`

## Use it yourself

Fork this repo, or just copy-paste things you need, and make it your own. **Please be sure to change your `.gitconfig` name and email address though!**
