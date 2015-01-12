HISTSIZE=3000

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export PATH=$PATH:~/bin

export HISTCONTROL=ignorespace

# Generic aliases
alias ll="ls -l"
alias grep="ggrep"
alias ag="ag -U"

# Bash autocomplete
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

# Git autocomplete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Git prompt
source ~/.git-prompt.sh
export PS1='\h \w$(__git_ps1 " (%s)") \$ '

# vagrant
alias vup="vagrant up"
alias vsu="vagrant suspend"
alias vha="vagrant halt"

# De facto aliases
source ~/.defacto_aliases
