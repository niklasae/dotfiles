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
    
also to enable plugin [Command-T](https://github.com/wincent/Command-T) (depends on vim compiled with ruby and same version locally)

    cd ~/.vim/bundle/Command-T/ruby/command-t
    ruby extconf.rb
    make

## Inspired by... ##

[nelstrom/dotfiles](https://github.com/nelstrom/dotfiles) (Vim pre [@cbc8d0ebc2e74a433a09eaf17dc7cbde1c9744f8](https://github.com/holman/dotfiles/commit/cbc8d0ebc2e74a433a09eaf17dc7cbde1c9744f8))

[holman/dotfiles](https://github.com/holman/dotfiles)

