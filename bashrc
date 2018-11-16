reset=$(tput sgr0)

[ -f /etc/bash_completion.d/git-prompt ] && source /etc/bash_completion.d/git-prompt
if [ "$(type -t __git_ps1)" = function ]; then
  PS1='\[\e[32m\]\u@\h \[\e[94m\]\w$(__git_ps1) \$ \[$reset\]'
else
  PS1='\[\e[32m\]\u@\h \[\e[94m\]\w \$ \[$reset\]'
fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'

export PATH=$HOME/.local/bin:/usr/local/bin:$PATH
export DOCKER_HOST='tcp://192.168.99.100:2376'
export DOCKER_CERT_PATH=/mnt/c/Users/Jamie/.docker/machine/certs
export DOCKER_TLS_VERIFY=1
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PROMPT_DIRTRIM=2

# Add autocomplete for scripts
_managesh_options='makemigrations migrate runserver startapp'
complete -W "${_managesh_options}" 'manage.sh'
