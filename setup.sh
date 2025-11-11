#!/usr/bin/env bash

set -e

echo "== Mac setup script =="

# Install Homebrew if it's not already installed
if ! command -v brew &> /dev/null; then
  echo "Homebrew not found. Installing Homebrew"
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

  if [[ $(uname -m) == 'arm64' ]]; then
      echo "Adding Homebrew to PATH for Apple Silicon..."
      echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
      eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  echo "Homebrew installed successfully!"
else
  echo "Homebrew is already installed"
fi

# update Homebrew
echo "Updating Homebrew..."
brew update

# install packages from Brewfile
echo "Installing packages from Brewfile..."
brew bundle install --file=Brewfile

# macos settings
defaults write com.apple.finder AppleShowAllFiles YES

# xcode command line tools
xcode-select --install

echo "== Installation complete! =="
