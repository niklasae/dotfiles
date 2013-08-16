#!/usr/bin/env bash
#
# powerline setup
# Read more over on https://powerline.readthedocs.org/en/latest/index.html
#
# More patched fonts available on https://github.com/Lokaltog/powerline-fonts
#
# Great answere on how to install/setup tmux on Ubunut on
# http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin
#

# Install powerline locally
pip install --user git+git://github.com/Lokaltog/powerline

# Setting up fonts - patched or fontconfig
mkdir -p ~/.fonts
echo "Should we get some patched fonts?"
select is_patching in Yes No
do
    case $is_patching in
        Yes )
            echo "Patching fonts..."
            wget -P ~/.fonts/ "https://github.com/Lokaltog/powerline-fonts/raw/master/UbuntuMono/Ubuntu Mono derivative Powerline.ttf"
            wget -P ~/.fonts/ "https://github.com/Lokaltog/powerline-fonts/raw/master/UbuntuMono/Ubuntu Mono derivative Powerline Bold.ttf"
            wget -P ~/.fonts/ "https://github.com/Lokaltog/powerline-fonts/raw/master/UbuntuMono/Ubuntu Mono derivative Powerline Bold Italic.ttf"
            wget -P ~/.fonts/ "https://github.com/Lokaltog/powerline-fonts/raw/master/UbuntuMono/Ubuntu Mono derivative Powerline Italic.ttf"
            wget -P ~/.fonts/ "https://github.com/Lokaltog/powerline-fonts/raw/master/DroidSansMono/Droid Sans Mono for Powerline.otf"
            echo "No you need to set the fonts in ~/.gvimrc and the terminal Edit > Profile Preferences > Fonts"
            break;;
        No )
            echo "Setting up fontconfig..."
            wget -P ~/.fonts/ "https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf"
            mkdir -p ~/.config/fontconfig/conf.d/
            wget -P ~/.config/fontconfig/conf.d/ "https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf"
            echo "Powerline font should be set up no, no need to do anything else... given everything looks cool..."
            break;;
    esac
done
fc-cache -vf ~/.fonts

# Config exist in ~/.tmux.conf, ~/.vimrc and ~/.zshrc
