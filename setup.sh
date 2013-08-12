#!/usr/bin/env bash
#
# Setting stuff up...
#

## Calling dir
calling_dir=$PWD

# Get dotfiles directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Init submodules
cd $DIR
git submodule init
git submodule update

# Setup symbolic links
ln -s "$DIR/bin" ~/.bin
ln -s "$DIR/config/pep8" ~/.config/pep8
ln -s "$DIR/config/flake8" ~/.config/flake8
ln -s "$DIR/gitconfig" ~/.gitconfig
ln -s "$DIR/gvimrc" ~/.gvimrc
sudo rm -rf ~/.pip && ln -s "$DIR/pip" ~/.pip
ln -s "$DIR/vim" ~/.vim
ln -s "$DIR/vimrc" ~/.vimrc
ln -s "$DIR/vimrc.bundles" ~/.vimrc.bundles
ln -s "$DIR/zshrc" ~/.zshrc

# Create dir for Vim backup, swap and other files...
# [vim-sensible](https://github.com/tpope/vim-sensible)
mkdir -p ~/.local/share/vim/{swap,backup,undo,sessions}

# Setup all Vim plugins
vim -u ~/.vimrc.bundles +BundleInstall +qa

# Enable Vim plugin Command-T
# Depends on Vim compiled with same version of ruby which is set up in prereq.sh
cd ~/.vim/bundle/Command-T/ruby/command-t
ruby extconf.rb
make

# Go back to dir we came from
cd $calling_dir
