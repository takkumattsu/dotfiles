#!/bin/sh


BUNDLE_DIR=$HOME/.vim/bundle

if [ ! -e $BUNDLE_DIR ]; then

	# create directory
	mkdir -p $BUNDLE_DIR

	# install neobundle
	git clone git://github.com/Shougo/neobundle.vim.git $BUNDLE_DIR/neobundle.vim
fi

# backup .vimrc
if [ -e $HOME/.vimrc ]; then
	# backup
	mv $HOME/.vimrc $HOME/.vimrc.`date +%Y%m%d%H%M%S`.bk
fi

# cretae synbolic link
ln -s $PWD/vimrc $HOME/.vimrc
