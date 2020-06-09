#!/bin/bash

# Install command-line tools using Homebrew

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# GNU core utilities (those that come with OS X are outdated)
brew install coreutils
brew install moreutils
# GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils
# GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed

# Install wget with IRI support
brew install wget

# Install more recent versions of some OS X tools
brew install vim 
brew install nano
brew install grep

# Install other useful binaries
brew install aria2
brew install git-standup
# brew install httpie
brew install mysql@5.6
brew install mongodb
brew install the_silver_searcher
brew install node # This installs `npm` too using the recommended installation method
brew install ffmpeg
brew install zsh
brew install git-recent
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install youtube-dl
brew install ttfautohint fontforge
brew install unrar
brew install tree

# Remove outdated versions from the cellar
brew cleanup

# experimental stuff
brew install deno

