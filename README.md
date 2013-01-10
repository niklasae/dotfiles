dotfiles
========

## Installation ##

Clone the repo:

    git clone ssh://git@github.com/niklasae/dotfiles.git ~/dotfiles

Check out git submodules:

    cd dotfiles
    git submodule init
    git submodule update

Create symlinks:

    ln -s ~/dotfiles/vimrc ~/.vimrc
    ln -s ~/dotfiles/vim ~/.vim
    ln -s ~/dotfiles/gitconfig ~/.gitconfig

Vim's backup and swap files goes into '~/tmp', so that has to exist...

    mkdir ~/tmp

and Vim's plugin management is done by [Vundle](https://github.com/gmarik/vundle), so don't forget

    :BundleInstall


## Inspired by... ##

[nelstrom/dotfiles](https://github.com/nelstrom/dotfiles)
[holman/dotfiles](https://github.com/holman/dotfiles)

