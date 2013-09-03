#!/usr/bin/env bash
#
# dotfiles prerequisites
#

## Calling dir
calling_dir=$PWD

# Get dotfiles directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# vim
sudo pip install -U jedi
sudo pip install -U pyflaskes
sudo pip install -U pylint 

npm install -g coffee-script
npm install -g coffeelint

# pomo - local version of pomo (depends on libnotify...)
gem install libnotify pomo

echo "Which OS are you on?"
select os in Ubuntu Other
do
    case $os in
        Ubuntu )
            sudo aptitude install -y exuberant-ctags
            break;;
        Other )
            echo "You probably want to unlink the default phantomjs in ~/.bin..."
            break;;
    esac
done

# Go back to dir we came from
cd $calling_dir
