" -----------------------------------------------------------------------------
"  Last Change: 27 Oct 2014
"  File: .vimrc
"  Author: TakkuMattsu (takku.mattsu@gmail.com)
" -----------------------------------------------------------------------------

" -----------------------------------------------------------------------------
" Base settings {{{

set nocompatible

" syntax on
syntax enable

" terminal color
set t_Co=256

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

" hilight
nnoremap <Leader>c :<C-u>setlocal cursorline! cursorcolumn!<CR>

" file encoding
set fileencodings=ucs-bom,utf-8,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932

" mac file format
set fileformats+=mac

" statusline enable
set laststatus=2

" statusline format
" filename [FENC="file encoding"] [FORMAT="LF/CRLF/CR"] [BOM="YES/NO"] [ENC="encording"] [LINE="current line number"/"line number]
"set statusline=%f\ [FENC=%{&fenc}]\ [FORMAT=%{GetFormat()}]\ [BOM=%{GetBomb()}]\ [ENC=%{&enc}]\ [LINE=%l/%L]
let g:Powerline_symbols = 'fancy'

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

if has('win32') || has('win64')
  " Windowsの場合の処理
  let $PATH = 'C:\Program Files (x86)\Git\cmd;'.$PATH  
endif


" function

" GetBomb function
" -----------------------------------------------------------------------------
:function! GetBomb()
  :let var = &bomb
  :if var == 0
    return "NO"
  :else
    return "YES"
  :endif
endfunction

" GetFormat function
" -----------------------------------------------------------------------------
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
" -----------------------------------------------------------------------------

"autocmd BufNewFile *.sh 0r $HOME/.vim/template/skel.sh
"autocmd BufNewFile *.pl 0r $HOME/.vim/template/skel.pl

" }}}

"NeoComplete {{{
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"}}}


" teraterm風こぴぺ {{{
" thanks
" <http://seekpoint.blogspot.jp/2013/01/teratermvim.html>
" -----------------------------------------------------------------------------
" GUI
set guioptions+=a
" CUI
"set clipboard+=autoselect
nnoremap <RightMouse> "*p
inoremap <RightMouse> <C-r><C-o>*

" }}}

"  binary edit {{{
"  thanks
"  <http://d.hatena.ne.jp/rdera/20081022/1224682665>
" -----------------------------------------------------------------------------

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

" dein settings {{{
if &compatible
  set nocompatible
endif

" dein.vimのディレクトリ
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" なければgit clone
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

" 管理するプラグインを記述したファイル
let s:toml = '~/.dein.toml'
let s:lazy_toml = '~/.dein_lazy.toml'

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" その他インストールしていないものはこちらに入れる
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

" }}}

" colorscheme {{{
" -----------------------------------------------------------------------------
" mrkn256
" <https://github.com/mrkn/mrkn256.vim>
colorscheme mrkn256

" }}}

" Filetype {{{
" -----------------------------------------------------------------------------

" vim {{{
autocmd Filetype vim setlocal foldmethod=marker
" }}}

" python {{{
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4

" }}}

" }}}
" vim: foldmethod=marker
