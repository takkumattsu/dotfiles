#!/bin/sh

VIM_RUNTIME_DIR=~/vimfiles
BUNDLE_DIR=$VIM_RUNTIME_DIR/bundle
VIMRC=~/.vimrc
VIM_DIR=~/.vim

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
    # Is there any pattern?
    echo
  fi

}


#=====================================
# main

# set backup list 
CHECK_TARGET="$VIMRC $VIM_DIR $VIM_RUNTIME_DIR"

# backup
for target in ${CHECK_TARGET[@]}
do
  backup $target
done

# create directory
mkdir -p $BUNDLE_DIR
# install neobundle
git clone git://github.com/Shougo/neobundle.vim.git $BUNDLE_DIR/neobundle.vim

# cretae symbolic link
ln -s $PWD/.vimrc $VIMRC
ln -s $VIM_RUNTIME_DIR ~/.vim

# init neobundle install
vim +NeoBundleInstall +q
