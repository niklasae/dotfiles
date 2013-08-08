#!/usr/bin/env bash
#
# dotfiles prerequisites
#

# zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# vim
sudo pip install -U jedi
sudo pip install -U pyflaskes
sudo pip install -U pylint 

npm install -g coffee-script
npm install -g coffee-lint

# http://jeroenbourgois.be/command-t-macvim-and-rvm/
vim_ruby_version=$(vim --version | grep -o 'ruby-[0-9\.]*' | grep -o '[0-9\.]*')
rvm install $vim_ruby_version
rvm use $vim_ruby_version --default

echo "Which OS are you on?"
select os in Ubuntu Other
do
    case $os in
        Ubuntu )
            sudo aptitude install -y exuberant-ctags
            break;;
        Other )
            echo "Nothing for you..."
            break;;
    esac
done
