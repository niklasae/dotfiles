#!/usr/bin/env bash
#
# Setting stuff up...
#

## Calling dir
calling_dir=$PWD

# Get dotfiles directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Clone Vundle for vim
git clone https://github.com/VundleVim/Vundle.vim.git "$DIR/vim/bundle/Vundle.vim"

# Setup vim-plug for NeoVim -- https://github.com/junegunn/vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install Nerd fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DroidSansMono.zip
unzip DroidSansMono.zip -d ~/.fonts
fc-cache -fv

# Setup symbolic links
# Should check if they already exist and in that case unlink or delete
ln -s "$DIR/bin" ~/.bin
ln -s "$DIR/aliases" ~/.aliases
ln -s "$DIR/coffeelint.json" ~/coffeelint.json
ln -s "$DIR/config/pep8" ~/.config/pep8
ln -s "$DIR/config/flake8" ~/.config/flake8
ln -s "$DIR/git" ~/.git
ln -s "$DIR/gitconfig" ~/.gitconfig
ln -s "$DIR/gitignore" ~/.gitignore
ln -s "$DIR/gvimrc" ~/.gvimrc
ln -s "$DIR/nvim/init.vim" ~/.config/nvim/init.vim
ln -s "$DIR/nvim/init-plugs.vim" ~/.config/nvim/init-plugs.vim
ln -s "$DIR/nvim/conf" ~/.config/nvim/conf
sudo rm -rf ~/.pip && ln -s "$DIR/pip" ~/.pip
ln -s "$DIR/pomorc" ~/.pomorc
ln -s "$DIR/pylintrc" ~/.pylintrc
git clone https://github.com/gpakosz/.tmux.git "$DIR/oh-my-tmux"
ln -s "$DIR/oh-my-tmux/tmux.conf" ~/.tmux.conf
ln -s "$DIR/tmux.conf.local" ~/.tmux.conf.local
ln -s "$DIR/tmux" ~/.tmux
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

# Setup Oh My Zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Go back to dir we came from
cd $calling_dir
