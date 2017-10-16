# Termux Config
#### Chrome OS

**Termux Config** is my checklist I follow to set up a new Chromebook's development environment. It gets me up to speed with Git, Node, Ruby, and more so I can more quickly get back to work.

## Contents

| File | Description |
| --- | --- |
| `.gitconfig` | Global Git configuration to specify my name and email, shortcuts, colors, and more. |
| `.gitignore` | The ignore file from [twbs/bootstrap](https://github.com/twbs/bootstrap) that I use everywhere. |

## Checklist

### 1. Run install.sh

- Open Termux
- Update Termux enter `apt update && apt upgrade`
- Setup access to local storage enter `termux-setup-storage`
- Download install.sh to your computer. Locate the file in Termux
- Enter `./install.sh` in a Terminal window to run the script

Install.sh will install:
- A better version of wget
- npm and nodejs
- ruby
- coreutils

Then install.sh will setup, and build the latest version of Hugo.

### 2. Prep Terminal

- Copy `.bash-profile` into your `$HOME` directory
- Copy `.gitconfig` into your `$HOME` directory
- Copy `.gitignore` into your `$HOME` directory

## Use it yourself

Fork this repo, or just copy-paste things you need, and make it your own. **Please be sure to change your `.gitconfig` name and email address though!**
