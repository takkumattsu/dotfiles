" ----------------------------------------------
"  Last Change: 07 Mar 2013
"  File: .vimrc
"  Author: TakkuMattsu (takku.mattsu@gmail.com)
" ----------------------------------------------

" ----------------------------------------------
" Base settings {{{

set nocompatible

" syntax on
syntax enable

" terminal color
if $TERM == "xterm"
  set t_Co=256
else
  set t_Co=8
endif

" line number
"set number

" backspace
set backspace=2

" list
set list

" tab
set tabstop=4
set lcs=tab:>-,

" encoding
set encoding=utf-8

" file encoding
set fileencodings=ucs-bom,utf-8,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932

" mac file format
set fileformats+=mac

" statusline enable
set laststatus=2

" statusline format
" filename [FENC="file encoding"] [FORMAT="LF/CRLF/CR"] [BOM="YES/NO"] [ENC="encording"] [LINE="current line number"/"line number]
"set statusline=%f\ [FENC=%{&fenc}]\ [FORMAT=%{GetFormat()}]\ [BOM=%{GetBomb()}]\ [ENC=%{&enc}]\ [LINE=%l/%L]

" When joining lines in Japanese, don't enter a blank
set formatoptions+=mM

" charcter width
set ambiwidth=double

" Display as much as possible the last line of the screen
set display+=lastline

" enable incremental search
set incsearch

" enable wilemenu
set wildmenu

" set Pmenu
hi Pmenu ctermbg=darkcyan ctermfg=white
hi PmenuSel ctermbg=darkblue ctermfg=white
hi PmenuSbar ctermfg=black
hi PmenuThumb ctermfg=blue

" Fullwidth space visible
scriptencoding cp932
highlight link ZenkakuSpace Error
match ZenkakuSpace /　/


" function

" GetBomb function
" ----------------------------------------------
:function! GetBomb()
  :let var = &bomb
  :if var == 0
    return "NO"
  :else
    return "YES"
  :endif
endfunction

" GetFormat function
" ----------------------------------------------
:function! GetFormat()
  :let var = &ff
  :if var == "unix"
    return "LF"
  :elseif var == "dos"
    return "CRLF"
  :else
    return "CR"
  :endif
endfunction

" }}}


" template {{{
" thanks
" <http://blog.paz-para.com/?p=1733>
" If you use temlate, create $HOME/.vim/template/skel.xx
" ----------------------------------------------

"autocmd BufNewFile *.sh 0r $HOME/.vim/template/skel.sh
"autocmd BufNewFile *.pl 0r $HOME/.vim/template/skel.pl

" }}}


" neocomplcache {{{
" ----------------------------------------------
let g:neocomplcache_enable_at_startup = 1

" }}}


"  binary edit {{{
"  thanks
"  <http://d.hatena.ne.jp/rdera/20081022/1224682665>
" ----------------------------------------------

augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END

" }}}


"  neobundle {{{
"  <https://github.com/Shougo/neobundle.vim>
" ----------------------------------------------
if has('vim_starting')
  set runtimepath+=~/vimfiles/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/vimfiles/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

"  Recommended to install
"  After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
" ----------------------------------------------
NeoBundle 'Shougo/vimproc'

"  My Bundles here:
"
"  Note: You don't set neobundle setting in .gvimrc!
"  Original repos on github
"  ----------------------------------------------
"NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'Lokaltog/vim-easymotion'
"NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
NeoBundle 'mrkn/mrkn256.vim'

"  vim-scripts repos
" ----------------------------------------------
"NeoBundle 'L9'
"NeoBundle 'FuzzyFinder'
"NeoBundle 'rails.vim'

"  Non github repos
"  ----------------------------------------------
"NeoBundle 'git://git.wincent.com/command-t.git'

"  Non git repos
" ----------------------------------------------
NeoBundle 'http://github.com/Shougo/neocomplcache.git'

" ...
" ----------------------------------------------


filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck

" }}}


" colorscheme {{{
" ----------------------------------------------
" mrkn256
" <https://github.com/mrkn/mrkn256.vim>
colorscheme mrkn256

" }}}

" vim: foldmethod=marker :
