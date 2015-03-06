# get sudo up front and keep it alive
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# get path to script
path=$(dirname "$(readlink -f "$0")")

# get vendor files
git submodule update --init
wget -qO- http://goo.gl/gOEzTh | bsdtar -xvC $path/.vendor/ngrok -f-
curl -sS https://getcomposer.org/installer | php -- --install-dir=$path/.vendor/composer

# link dotfiles
sh $path/make-links.sh

# set os preferences
sh $path/osx-preferences.sh

# install homebrew and cask, then packages
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install caskroom/cask/brew-cask
sh $path/install-packages.sh

# copy font for vim
cp $path/.vendor/DroidSansMonoPowerline/Droid\ Sans\ Mono\ for\ Powerline.otf ~/Library/Fonts/

echo "Done! Read README.md to see what else you need to do"
