#!/bin/sh

VIMRC=~/.vimrc
SCREENRC=~/.screenrc
TMUX_DIR=~/.tmux
TMUX_CONF=~/.tmux.conf
TMUX_RC=~/.tmux-powerlinerc
BASHRC=~/.bashrc
BASH_PROFILE=~/.bash_profile
CACHE_DIR=~/.cache
VIM_DEIN_DIR=$CACHE_DIR/dein
DEIN_TOML=~/.dein.toml
DEIN_LAZY_TOML=~/.dein_lazy.toml
TIGRC=~/.tigrc
INPUTRC=~/.inputrc

#=====================================
# backup function
backup()
{
  local TARGET=$1
  local BACKUP=`date +%Y%m%d%H%M%S`

  if [ -L $TARGET ]; then

    #if symbolic link, remove.
    rm -f $TARGET

  elif [ -f $TARGET -o -d $TARGET ]; then

    # backup
    mv $TARGET $TARGET.$BACKUP.bk
 
  else
    # Target is not exist.
    echo
  fi
}

#=====================================
# main

# set backup list 
CHECK_TARGET="$VIMRC $SCREENRC $TMUX_DIR $TMUX_CONF $BASHRC $BASH_PROFILE $CACHE_DIR $DEIN_TOML $DEIN_LAZY_TOML $TIGRC $INPUTRC"

# backup
for target in ${CHECK_TARGET[@]}
do
  backup $target
done

# create dein directory
mkdir -p $VIM_DEIN_DIR

# install tmux-powerline
git clone https://github.com/takkumattsu/tmux-powerline.git $TMUX_DIR/tmux-powerline

# cretae symbolic link
ln -s $PWD/.vimrc $VIMRC
ln -s $PWD/.screenrc $SCREENRC
ln -s $PWD/.tmux.conf $TMUX_CONF
ln -s $PWD/.bashrc $BASHRC
ln -s $PWD/.bash_profile $BASH_PROFILE
ln -s $PWD/.dein.toml $DEIN_TOML
ln -s $PWD/.dein_lazy.toml $DEIN_LAZY_TOML
ln -s $PWD/.tigrc $TIGRC
ln -s $PWD/.tmux-powerlinerc $TMUX_RC
ln -s $PWD/.inputrc $INPUTRC
