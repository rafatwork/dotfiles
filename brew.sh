#!/usr/bin/env bash

# Install command-line tools and apps.

# Check for Homebrew and install if we don’t have it.
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Taps
brew tap franklouwers/homebrew-franklouwers # Belgium e-ID (https://github.com/franklouwers/homebrew-franklouwers)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
brew install awscli
brew install cask
brew install curl
brew install docker-compose
brew install exiv2
brew install ffmpeg
brew install git
brew install git-lfs
brew install gs
brew install htop
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install nano
brew install p7zip
brew install pigz
brew install pv
brew install python
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install telnet
brew install tree
brew install vbindiff
brew install zopfli

# Development
brew install composer
brew install mutagen-io/mutagen/mutagen
brew install mutagen-io/mutagen/mutagen-compose-beta
brew install nvm
brew install yarn

# Apps
brew install --cask docker
brew install --cask eid-be
brew install --cask eid-be-viewer
brew install --cask firefox
brew install --cask google-chrome
brew install --cask google-drive
brew install --cask insomnia
brew install --cask keepassx
brew install --cask microsoft-edge
brew install --cask microsoft-excel
brew install --cask microsoft-outlook
brew install --cask microsoft-powerpoint
brew install --cask microsoft-teams
brew install --cask microsoft-word
brew install --cask obsidian
brew install --cask onedrive
brew install --cask pdfsam-basic
brew install --cask phpstorm
brew install --cask sketchup-pro
brew install --cask slack
brew install --cask spotify
brew install --cask teamviewer
brew install --cask the-unarchiver
brew install --cask transmit
brew install --cask visual-studio-code
brew install --cask vlc

# Remove outdated versions from the cellar.
brew cleanup
