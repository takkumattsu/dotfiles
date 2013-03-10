#!/bin/sh


BUNDLE_DIR=$HOME/.vim/bundle
VIMRC=~/.vimrc

if [ ! -e $BUNDLE_DIR ]; then

    # create directory
    mkdir -p $BUNDLE_DIR

    # install neobundle
    git clone git://github.com/Shougo/neobundle.vim.git $BUNDLE_DIR/neobundle.vim
fi

if [ -L $VIMRC ]; then

    #if synbolic link, remove.
    rm -f $VIMRC

elif [ -f $VIMRC ]; then

    # backup .vimrc
    mv $VIMRC $VIMRC.`date +%Y%m%d%H%M%S`.bk
fi

# cretae synbolic link
ln -s $PWD/.vimrc $VIMRC
