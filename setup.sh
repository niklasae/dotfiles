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
ln -s "$DIR/coffeelint.json" ~/coffeelint.json
ln -s "$DIR/config/pep8" ~/.config/pep8
ln -s "$DIR/config/flake8" ~/.config/flake8
ln -s "$DIR/git" ~/.git
ln -s "$DIR/gitconfig" ~/.gitconfig
ln -s "$DIR/gitignore" ~/.gitignore
ln -s "$DIR/gvimrc" ~/.gvimrc
sudo rm -rf ~/.pip && ln -s "$DIR/pip" ~/.pip
ln -s "$DIR/pomorc" ~/.pomorc
ln -s "$DIR/pylintrc" ~/.pylintrc
ln -s "$DIR/vim" ~/.vim
ln -s "$DIR/vimrc" ~/.vimrc
ln -s "$DIR/vimrc.bundles" ~/.vimrc.bundles
ln -s "$DIR/zshrc" ~/.zshrc

# Create dir for Vim backup, undo and session  files
mkdir -p ~/.local/share/vim/{backup,undo,sessions}

# Setup all Vim plugins - can also be used for bundle updates
vim -u ~/.vimrc.bundles +BundleInstall! +BundleClean +qa

# Setup Tern for Vim (JavaScript)
if [[ -d ~/.vim/bundle/tern_for_vim ]]; then
    cd ~/.vim/bundle/tern_for_vim && npm install
fi

# Go back to dir we came from
cd $calling_dir
