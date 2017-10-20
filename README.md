# Chromux

**Chromux** is my opinionated setup for a Chromebook development environment. It gets me up to speed with Git, Node, Ruby, and more so I can more quickly get to work. The nice thing about Termux compared to many other platforms is if you mess something up...it's a quick 10 minute reinstall to reconfigure everything. Chromux includes oh-my-zsh integration as well.

## Contents

TBD

TODO: Add additional .dot-files

| File | Description |
| --- | --- |
| `.gitconfig` | Global Git configuration to specify my name and email, shortcuts, colors, and more. |
| `.bash_profile` | Global bash configuration with paths correctly set, bash prompt configurations, and more. |
| `.aliases` | Global aliases configuration with quick access to defined functions, and actions. |
| `.gitignore` | The ignore file from [twbs/bootstrap](https://github.com/twbs/bootstrap) that I use everywhere. |

## Checklist

### 1. Install requirements

- Open Termux
- Enter ```pkg install curl``` to install curl

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

- Enter `bash -c "$(curl -fsSL https://raw.githubusercontent.com/mrbrianhinton/chromebook-config/master/hugo-build.sh)"`

## Use it yourself

Fork this repo, or just copy-paste things you need, and make it your own. **Please be sure to change your `.gitconfig` name and email address though!**
