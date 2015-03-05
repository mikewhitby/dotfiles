# get path to script
path=$(dirname "$(readlink -f "$0")")

# make links
ln -sf $path/.bash_profile ~
ln -sf $path/.bash_completion.d ~
ln -sf $path/.gitconfig ~
ln -sf $path/.gitignore-global ~
ln -sf $path/.n98-magerun ~
ln -sf $path/.vim ~
ln -sf $path/.vimrc ~
ln -sf $path/bin ~
