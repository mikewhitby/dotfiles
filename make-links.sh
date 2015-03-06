# get relative path for symlinks
path=$(dirname "$(readlink -f "$0")")
relpath=$(python -c "import os.path; print os.path.relpath('$path', '$(echo ~)')")

# make links
ln -sf $relpath/.bash_profile ~
ln -sf $relpath/.bash_completion.d ~
ln -sf $relpath/.gitconfig ~
ln -sf $relpath/.gitignore-global ~
ln -sf $relpath/.n98-magerun ~
ln -sf $relpath/.vim ~
ln -sf $relpath/.vimrc ~
ln -sf $relpath/bin ~
