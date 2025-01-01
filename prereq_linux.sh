#!/usr/bin/env bash
#
# dotfiles prerequisites
#

## Calling dir
calling_dir=$PWD

# Get dotfiles directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# zsh
sudo apt install -y zsh
chsh -s `which zsh`

# vim
sudo pip3 install -U jedi
sudo pip3 install -U pyflakes
sudo pip3 install -U pylint
sudo pip3 install -U isort

sudo npm install -g coffeescript
sudo npm install -g coffeelint

echo "Which OS are you on?"
select os in Ubuntu Other
do
    case $os in
        Ubuntu )
            sudo apt-get install -y exuberant-ctags
            break;;
        Other )
            echo "You probably want to unlink the default phantomjs in ~/.bin..."
            break;;
    esac
done

# Go back to dir we came from
cd $calling_dir
