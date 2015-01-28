# My home directory

# Pre-requisites

These aren't set up by the quick start, so manually install them first.

- Droid Sans Mono font for Powerline from https://github.com/powerline/fonts

## Quick start (i.e. via SSH)

    git clone https://github.com/mikewhitby/home.git tmp && mv tmp/.git . && rm -rf tmp && git reset --hard
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    brew install macvim --override-system-vim
    vim +PluginInstall +qall
    wget -qO- http://goo.gl/gOEzTh | bsdtar -xvC .vendor/ngrok -f-
    curl -sS https://getcomposer.org/installer | php -- --install-dir=.vendor/composer
