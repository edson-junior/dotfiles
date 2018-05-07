#!/bin/bash


# to maintain cask ....
#     brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup`


# Install native apps

brew install caskroom/cask/brew-cask
# brew tap caskroom/versions

# daily
brew cask install dropbox
brew cask install enpass
brew cask install docker 
brew cask install docker-compose
brew cask install skype
brew cask install virtualbox

# dev
brew cask install iterm2
brew cask install atom

# browsers
brew cask install google-chrome-canary
brew cask install firefoxnightly

# players
brew cask install vlc
brew cask install spotify

# fonts
brew tap caskroom/fonts 
brew cask install font-fira-code
