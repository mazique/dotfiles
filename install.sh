#!/usr/bin/env bash

# Disable Gatekeeper
sudo spctl --master-disable

# Disable SIP in recovery mode
# Update MacOS
sudo softwareupdate -i -a

# Enable FileVault
sudo fdesetup enable

# Firewall Stealth mode
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on

#Finally, you may wish to prevent built-in software as well as code-signed, downloaded software from being whitelisted automatically
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned off sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp off
sudo pkill -HUP socketfilterfw

# Install XCode Command Line tools
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to PATH in ~/.zprofile:
brew install eval
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/Ruler/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew update
brew shellenv
brew doctor

brew analytics off
brew analytics

sudo apt install curl
#DONE.
