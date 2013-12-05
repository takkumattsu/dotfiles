dotfiles
========

My personal configuration

Install
--------

```bash
 $ git clone git://github.com/TakkuMattsu/dotfiles.git ~/dotfiles
```


Setup
--------

```bash
 $ cd ~/dotfiles
 $ ./setup.sh
```
This script create a symbolic link as following:

* .vim       -> vimfiles
* .vimrc     -> dotfiles/.vimrc
* .screenrc  -> dotfiles/.screenrc
* .tmux.conf -> dotfiles/.tmux.conf


> .bashrc is not install. if you need, manualy merge.

tmux conf is only installed at setup.sh
