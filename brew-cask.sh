#!/bin/bash


# to maintain cask ....
#     brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup`

# Install native apps

# brew install caskroom/cask/brew-cask
# brew tap caskroom/versions
brew tap homebrew/cask-versions

# daily
brew cask install dropbox
brew cask install enpass
brew cask install docker 
brew cask install docker-toolbox
brew cask install skype
# virtualbox needs to be unblocked in:
# - system preferences => Security & Privacy => General
brew cask install virtualbox
brew cask install the-unarchiver
brew cask install 1password
brew cask install kap
brew cask install keepingyouawake
brew cask install qlcolorcode
brew cask install teamviewer
brew cask install authy
# In case Postman throws the error message: "Postman can’t be opened because Apple cannot check it for malicious software."
# Run command: sudo spctl --master-disable
brew cask install postman
# Then run this command afterwards: sudo spctl --master-enable

# dev
brew cask install iterm2
brew cask install visual-studio-code
brew cask install sourcetree
brew cask install java8
brew cask install intellij-idea-ce

# browsers
brew cask install google-chrome
brew cask install firefox
brew cask install brave-browser

# players
brew cask install vlc
brew cask install spotify

# fonts
brew tap caskroom/fonts 
brew cask install font-fira-code

# messaging
# brew cask install signal

