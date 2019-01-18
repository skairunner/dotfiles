reset=$(tput sgr0)

[ -f /etc/bash_completion.d/git-prompt ] && source /etc/bash_completion.d/git-prompt
if [ "$(type -t __git_ps1)" = function ]; then
  PS1='\[\e[32m\]\u@\h \[\e[94m\]\w$(__git_ps1) \$ \[$reset\]'
else
  PS1='\[\e[32m\]\u@\h \[\e[94m\]\w \$ \[$reset\]'
fi
export PROMPT_DIRTRIM=2

for vim in nvim vim; do
  if command -v $vim >/dev/null; then
    export VISUAL=$vim
    break
  fi
done
if [ -z "$VISUAL" ]; then
  export VISUAL=vi
fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Add autocomplete for scripts
_managesh_options='makemigrations migrate runserver startapp'
complete -W "${_managesh_options}" 'manage.sh'

if command -v npiperelay.exe >/dev/null; then
    function docker () {
        if [ ! -S /var/run/docker.sock ]; then
          sudo sh -c "socat UNIX-LISTEN:/var/run/docker.sock,fork,group=docker,umask=007 EXEC:'$(command -v npiperelay.exe) -ep -s //./pipe/docker_engine',nofork &"
        fi
        command docker "$@"
    }
fi


eval "$(direnv hook bash)"
