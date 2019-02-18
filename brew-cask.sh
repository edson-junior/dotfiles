#!/bin/bash


# to maintain cask ....
#     brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup`

# Install native apps

# brew install caskroom/cask/brew-cask
# brew tap caskroom/versions

# daily
brew cask install dropbox
brew cask install enpass
brew cask install docker 
brew cask install docker-toolbox
brew cask install skype
brew cask install virtualbox
brew cask install the-unarchiver
brew cask install 1password

# dev
brew cask install iterm2
brew cask install visual-studio-code
brew cask install sourcetree

# browsers
brew cask install google-chrome
brew cask install firefox

# players
brew cask install vlc
brew cask install spotify

# fonts
brew tap caskroom/fonts 
brew cask install font-fira-code

# messaging
brew cask install signal

