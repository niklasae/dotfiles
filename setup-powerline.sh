#!/usr/bin/env bash
#
# *Installing Powerline quickly (Ubuntu, bash/zsh, tmux and vim)*
# https://ubuntu-mate.community/t/installing-powerline-as-quickly-as-possible/5381
# 
# *OLD*
# Powerline setup:
# https://powerline.readthedocs.org/en/latest/index.html
# Fonts:
# https://github.com/Lokaltog/powerline-fonts
#

# Calling dir
calling_dir=$PWD

# Install powerline locally
sudo apt-get install -y powerline

# Setting up fonts
git clone https://github.com/powerline/fonts.git ~/Code/fonts
cd ~/Code/fonts && ./install.sh

# Back to calling dir
cd $calling_dir

# Config exist in ~/.tmux.conf, ~/.vimrc and ~/.zshrc
