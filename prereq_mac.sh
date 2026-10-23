#!/usr/bin/env bash
#
# dotfiles prerequisites
#

## Calling dir
calling_dir=$PWD

# Get dotfiles directory
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# AWS
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/niklas/.zprofile
# eval "$(/opt/homebrew/bin/brew shellenv)"

# Brew casks
brew install --cask 1password-cli
brew install --cask asana
brew install --cask claude-code
brew install --cask cleanshot
brew install --cask codexbar
brew install --cask dropbox
brew install --cask jordanbaird-ice # Manage menue bar icons
brew install --cask karabiner-elements
brew install --cask libreoffice
brew install --cask linear-linear
brew install --cask mysqlworkbench
brew install --cask obsidian
brew install --cask opencode-desktop
brew install --cask openchamber
brew install --cask raycast   # No need for Alfred
brew install --cask rectangle # Split screen - Also look at https://apple.stackexchange.com/questions/309708/shortcuts-of-split-view
brew install --cask visual-studio-code
brew install --cask voxtype # voxtype.io - Local AI voice dictation (Mac and Linux)
brew install --cask whimsical

# Brew packages
brew install carapace # Auto-completion for the shell -
brew install fzf      # Needed for Neovim (LazyVim nvim-fzf) and zoxide
brew install gcc      # Needed for Neovim (LazyVim libstdc++)
brew install gh       # gh auth login
brew install ghostty
brew install git
brew install git-gui
brew install gron # Grep JSON output "fgrep" https://github.com/tomnomnom/gron
brew tap heroku/brew && brew install heroku
brew install lazygit
brew install mas # Mac App Store apps
brew install neovim
brew install node
brew install jandedobbeleer/oh-my-posh/oh-my-posh
brew install anomalyco/tap/opencode
brew install pipx
brew install ripgrep
brew trust docker/tap && brew install docker/tap/sbx # Dcker sandboxes for agents
brew install tmux
brew install uv
brew install wget
brew install zoxide
# JBL ATS Dev
brew install pkg-config mysql-client
brew install libmemcached
# AWS and k8s
# Read docs on assume started docs
# Read docs on AWS config/profiles
# Check Jobylon wiki - https://app.archbee.com/docs/a_AuybsU7_SMi0ikVf7OW/oIa6DA8CUzHfCviaqxdiV)
brew tap common-fate/granted && brew install granted
brew install k9s
brew install kubectl
brew install kubectx
brew install skyhook-io/tap/radar-desktop # k8s Radar UI
# Terraform
brew install tfenv
brw install terramate
# Fonts needed for dotfiles/Neovim
# NerdFontsSymbolsOnly  # Only font needed for Kitty/Nvim
brew install --cask font-symbols-only-nerd-font
# brew tap homebrew/cask-fonts
# brew search '/font-.*-nerd-font/' | awk '{ print $1 }' | xargs -I{} brew install --cask {} || true

# Mac App Store (mas)
# $ mas search Xcode
mas install 1087080039 # Quick View Calendar
mas install 803453959  # Slack
mas install 1475387142 # Tailscale
mas install 1291898086 # Toggl Track
mas install 497799835  # Xcode

# Go back to dir we came from
cd $calling_dir
