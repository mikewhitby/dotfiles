HISTSIZE=3000

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export PATH=$PATH:~/bin

export HISTCONTROL=ignorespace

# Generic aliases
alias ll="ls -lc"
if which ggrep > /dev/null; then
    alias grep="ggrep"
fi
alias vup="vagrant up"
alias vsu="vagrant suspend"
alias vha="vagrant halt"

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

# De facto aliases
if [ -f ~/.defacto_aliases ]; then
    source ~/.defacto_aliases
fi
