#for bash_completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

# import /usr/local/bin
export PATH=/usr/local/bin:$PATH

# alias
alias ls='ls --color'
# color
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# vim
alias vi='vim'

# PS1
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[37m\][\[\033[36m\]\u\[\033[37m\]@\h \[\033[32m\]\w\[\033[37m\]]\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '


PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# core utils

PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# history
function share_history {
    history -a
    history -c
    history -r
}
PROMPT_COMMAND='share_history'
shopt -u histappend
export HISTSIZE=9999
