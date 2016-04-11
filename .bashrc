#for bash_completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

# import /usr/local/bin
export PATH=/usr/local/bin:$PATH

# alias
alias ls='ls -G'
# color
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# vim
alias vi='vim'

# PS1
PS1='\[\033[37m\][\[\033[36m\]\u\[\033[37m\]@\h \[\033[32m\]\W\[\033[37m\]] '

# ungit
if [ -d $HOME/.nvm/ ]
then
  source ~/.nvm/nvm.sh
  nvm use v0.10.22 > /dev/null
fi

PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# tmuxの自動起動
if [ -z "$PS1" ]; then return ; fi

if [ -z $TMUX ] ; then
  if [ -z `tmux ls` ] ; then
    tmux
  else
    tmux attach
  fi
fi
