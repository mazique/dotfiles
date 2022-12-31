#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
#ISSUE with PATH. UNSURE CORRECT DIRECTORY
#PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
# brew install homebrew/php/php56 --with-gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2


# Personal packages to install.
brew install gnupg
brew install dark-mode

# Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
# brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install xpdf
# brew install xz

brew tap homebrew/services

# Install other useful binaries.
brew install exiv2
brew install git
brew install git-lfs
brew install kdiff3
brew install python3
sudo ln -s -f /opt/homebrew/bin/python3 /usr/local/bin/python
export PATH=/opt/homebrew/bin:$PATH

git config --global user.email "neekohuncho@icloud.com"
git config --global user.name "neekohuncho"
git config --global core.editor "vim"

git config --global merge.tool kdiff3
git config --global diff.tool kdiff3
git config --global mergetool.kdiff3.path /Applications/kdiff3.app/Contents/MacOS/kdiff3
git config --global difftool.kdiff3.path /Applications/kdiff3.app/Contents/MacOS/kdiff3
git config --global mergetool.kdiff3.trustExitCode false
git config --global difftool.kdiff3.trustExitCode false


git config --global init.defaultBranch main
git config --global fetch.prune true

brew install imagemagick --with-webp
brew install ssh-copy-id
brew install tree
brew install webkit2png
brew install wget
brew install unzip

# Make ZSH the default shell
brew install zsh
chsh -s /bin/zsh
echo $SHELL

# Install OhMyZSH and PowerLevel10k theme
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Customize OhMyZSH
nano ~/.zshrc
# set ZSH_THEME variable to name of theme, for example "powerlevel10k"
# save and close .zshrc file
source ~/.zshrc

# Customize OhMyZSH Plugins to include syntax-highlighting, autosuggestions, and sudo
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/sudo
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
nano ~/.zshrc
# plugins=(git zsh-syntax-highlighting zsh-autosuggestions sudo zsh-completions)
source ~/.zshrc

nano ~/.zshrc
#find the line source "$ZSH/oh-my-zsh.sh"
# Add the following before that line
# fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source ~/.zshrc

#FONTS
#pip3 install afdko
#./build.sh
#pip3 install fontmake
#./buildVFs.sh
#NERD-FONTS

# Remove outdated versions from the cellar.
brew cleanup
