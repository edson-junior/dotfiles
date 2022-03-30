#!/bin/bash

# to maintain install ....
#     brew update && brew upgrade brew-cask && brew cleanup && brew install cleanup`

# --cask native apps
brew tap homebrew/cask-versions

brew install --cask the-unarchiver
brew install --cask kap
brew install --cask keepingyouawake
brew install --cask teamviewer
brew install --cask authy
brew install --cask appcleaner

# password managers
brew install --cask 1password
brew install --cask lastpass

# dev
brew install --cask visual-studio-code
brew install --cask iterm2
brew install --cask postman

# browsers
brew install --cask google-chrome
brew install --cask chromium
brew install --cask firefox
brew install --cask brave-browser

# players
brew install --cask spotify

# fonts
brew tap homebrew/cask-fonts
brew install --cask font-fira-code

# messaging
brew install --cask signal

# design
brew install --cask figma

# cloud
brew install --cask dropbox
