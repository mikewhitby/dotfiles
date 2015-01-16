# My home directory

## Quick start (i.e. via SSH)

    git clone https://github.com/mikewhitby/home.git tmp && mv tmp/.git . && rm -rf tmp && git reset --hard
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    brew install macvim --override-system-vim
    vim +PluginInstall +qall
