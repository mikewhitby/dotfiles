# My home directory

# Pre-requisites

These aren't set up by the quick start, so manually install them first.

- Droid Sans Mono font for Powerline - https://github.com/powerline/fonts

## Quick start (i.e. via SSH)

    brew install macvim --override-system-vim
    brew install netcat nmap pv wget ssh-copy-id
    git clone https://github.com/mikewhitby/home.git tmp && mv tmp/.git . && rm -rf tmp && git reset --hard
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
    wget -qO- http://goo.gl/gOEzTh | bsdtar -xvC .vendor/ngrok -f-
    curl -sS https://getcomposer.org/installer | php -- --install-dir=.vendor/composer
