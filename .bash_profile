
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH:~/bin
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export HISTSIZE=3000
export HISTCONTROL=ignorespace

# Brew bash autocomplete
if which brew > /dev/null; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi
fi

# Git autocomplete and prompt
if [ -f ~/bin/git-prompt.sh ]; then
    source ~/bin/git-prompt.sh
    export PS1='\h \w$(__git_ps1 " (%s)") \$ '
fi

# Bash completion
for file in ~/.bash_completion.d/*; do
  source $file
done

# Aliases
alias ll="ls -l --color"
alias ls="ls --color"
alias vup="vagrant up"
alias vsu="vagrant suspend"
alias vha="vagrant halt"
alias vssh="vagrant ssh"
