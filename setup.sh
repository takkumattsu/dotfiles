#!/bin/sh

VIM_RUNTIME_DIR=~/vimfiles
BUNDLE_DIR=$VIM_RUNTIME_DIR/bundle
VIMRC=~/.vimrc
VIM_DIR=~/.vim
SCREENRC=~/.screenrc
TMUX_DIR=~/.tmux
TMUX_CONF=~/.tmux.conf
BASHRC=~/.bashrc
BASH_PROFILE=~/.bash_profile

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
CHECK_TARGET="$VIMRC $VIM_DIR $VIM_RUNTIME_DIR $SCREENRC $TMUX_DIR $TMUX_CONF $BASHRC $BASH_PROFILE"

# backup
for target in ${CHECK_TARGET[@]}
do
  backup $target
done

# create directory
mkdir -p $BUNDLE_DIR
# install neobundle
git clone git://github.com/Shougo/neobundle.vim.git $BUNDLE_DIR/neobundle.vim

# install tmux-powerline
git clone https://github.com/erikw/tmux-powerline.git $TMUX_DIR/tmux-powerline

# cretae symbolic link
ln -s $PWD/.vimrc $VIMRC
ln -s $VIM_RUNTIME_DIR ~/.vim
ln -s $PWD/.screenrc $SCREENRC
ln -s $PWD/.tmux.conf $TMUX_CONF
ln -s $PWD/.bashrc $BASHRC
ln -s $PWD/.bash_profile $BASH_PROFILE

# init neobundle install
vim +NeoBundleInstall +q
