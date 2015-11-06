#!/bin/sh
#
# Homebrew check & install
#
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#
# Update Homebrew
#
echo "Brew update..."
brew update

#
# Tools Installation
#
# Install GNU core utilities (those that come with OS X are outdated)
echo "Installing coreutils..."
brew install coreutils 
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
echo "Installing findutils..."
brew install findutils
# Install Bash 4
echo "Installing bash..."
brew install bash
# Install more recent versions of some OS X tools
echo "Tap dupes..."
brew tap homebrew/dupes
echo "Installing grep..."
brew install homebrew/dupes/grep
# Add to PATH
printf "$PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH" >> ~/.bash_profile

#
# Brew Packages
#
packages=(
	wget
	ffmpeg
	node
	imagemagick
	elasticsearch
	htop-osx
	homebrew/versions/mysql55
	homebrew/php/php54-mcrypt
	python
	tree
	rename
	ack
)

#
# Install Packages
#
echo "Installing packages..."
brew install ${packages[@]}

#
# Clean up
#
echo "Brew cleanup..."
brew cleanup

#
# Cask instal
#
echo "Installing cask..."
brew install caskroom/cask/brew-cask

#
# Cask Apps
#
apps=(
	iterm2
	dropbox
	angry-ip-scanner
	sublime-text
	macvim
	google-chrome
	firefox
	inkscape
	gimp
	controlplane
	sourcetree
	skype
	oovoo
	keepassx
	viber
	google-drive
	google-hangouts
	evernote
	teamviewer
	vlc
	thunderbird
	flash
)

#
# Install apps to /Applications
# Default is: /Users/$user/Applications
#
echo "Installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

#
# Clean up
#
echo "Casc cleanup..."
brew cask cleanup

#
# Fonts
#
brew tap caskroom/fonts
fonts=(
  font-m-plus
  font-clear-sans
  font-roboto
)

#
# Install fonts
#
echo "Installing fonts..."
brew cask install ${fonts[@]}