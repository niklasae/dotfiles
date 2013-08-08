# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git python)

source $ZSH/oh-my-zsh.sh

# My Customisations...
# ~~~~~~~~~~~~~~~~~~~~

### General

# Add ~/bin to PATH
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin/:$PATH"

# 256 bit colors in tmux
[[ -z "$TMUX" ]] && export TERM=xterm-256color

# Super secret stuff...
[[ -s "$HOME/.secretrc" ]] && source "$HOME/.secretrc"

# your project folder that we can `c [tab]` to
[[ -d "$HOME/Code" ]] && export PROJECTS="$HOME/Code"


### node.js

# nvm
export NVM_HOME="$HOME/.nvm"
[[ -s "$NVM_HOME/nvm.sh" ]] && source "$NVM_HOME/nvm.sh"

# nvm tab completion
[[ -s "$NVM_HOME/bash_completion" ]] && source "$NVM_HOME/bash_completion"


### python

# virtualenvwrapper
[[ -s /usr/local/bin/virtualenvwrapper.sh ]] && source /usr/local/bin/virtualenvwrapper.sh


### ruby

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source $HOME/.rvm/scripts/rvm


### tools

# autoenv (https://github.com/kennethreitz/autoenv).
[[ -s /usr/local/bin/activate.sh ]] && source /usr/local/bin/activate.sh

# use_env / autoenv (https://github.com/kennethreitz/autoenv/wiki/Cookbook)
# The use_env call below is a reusable command to activate/create a new Python
# virtualenv, requiring only a single declarative line of code in your .env files.
# It only performs an action if the requested virtualenv is not the current one.
use_env() {
  typeset venv
  venv="$1"
  if [[ "${VIRTUAL_ENV:t}" != "$venv" ]]; then
    if workon | grep -q "$venv"; then
      workon "$venv"
    else
      echo -n "Create virtualenv $venv now? (Yn) "
      read answer
      if [[ "$answer" == "Y" ]]; then
        mkvirtualenv "$venv"
      fi
    fi
  fi
}


### aliases
alias kgb="setxkbmap gb"
alias kse="setxkbmap se"

# Other...
# ~~~~~~~~

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Add RVM to PATH for scripting
export PATH=$PATH:$HOME/.rvm/bin
