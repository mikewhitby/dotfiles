# get sudo and keep it alive, but only if not called by bootstrap.sh
if [ "$(ps $PPID | tail -n 1 | awk "{print \$6}")" != "bootstrap.sh" ]; then
    sudo -v
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
fi

# install bash 4 and GNU core and findutils to replace outdates OSX versions
brew tap homebrew/dupes
brew install bash
brew install coreutils
brew install findutils
brew install diffutils
brew install grep
brew install gnu-sed
brew install gnu-tar
brew install gnu-which
brew install gzip
brew install watch
brew install wget

# install stuff OSX didn't come with
brew install ack
brew install bash-completion
brew install ctags
brew install macvim
brew install mysql
brew install netcat
brew install nmap
brew install phpmd
brew install pv
brew install git

# install DMGs
brew cask install iterm2
brew cask install macdown
brew cask install google-chrome
brew cask install dropbox
brew cask install integrity
brew cask install virtualbox
brew cask install spectacle
brew cask install sublime-text
brew cask install appcleaner
brew cask install vagrant
brew cask install phpstorm
brew cask install cyberduck
brew cask install libreoffice
brew cask install ansible

# vagrant plugins
vagrant plugin install vagrant-bindfs

# cleanup
brew cleanup
brew cask cleanup
