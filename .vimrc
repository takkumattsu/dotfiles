" -----------------------------------------------------------------------------
"  Last Change: 07 Mar 2013
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

" file encoding
set fileencodings=ucs-bom,utf-8,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932

" mac file format
set fileformats+=mac

" statusline enable
set laststatus=2

" statusline format
" filename [FENC="file encoding"] [FORMAT="LF/CRLF/CR"] [BOM="YES/NO"] [ENC="encording"] [LINE="current line number"/"line number]
set statusline=%f\ [FENC=%{&fenc}]\ [FORMAT=%{GetFormat()}]\ [BOM=%{GetBomb()}]\ [ENC=%{&enc}]\ [LINE=%l/%L]

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


" neocomplcache {{{
" ----------------------------------------------
" Disable AutoComplPop. Comment out this line if AutoComplPop is not installed.
let g:acp_enableAtStartup = 0
" Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 3
" buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder 
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define file-type dependent dictionaries.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword, for minor languages
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion, which require computational power and may stall the vim. 
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" }}}

" neosnipet {{{
" -----------------------------------------------------------------------------

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" }}}

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


"  neobundle {{{
"  <https://github.com/Shougo/neobundle.vim>
" -----------------------------------------------------------------------------
if has('vim_starting')
  set runtimepath+=~/vimfiles/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/vimfiles/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

"  Recommended to install
"  After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
" -----------------------------------------------------------------------------
"NeoBundle 'Shougo/vimproc'

"  My Bundles here:
"
"  Note: You don't set neobundle setting in .gvimrc!
"  Original repos on github
"  ----------------------------------------------------------------------------
"NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'Lokaltog/vim-easymotion'
"NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
NeoBundle 'mrkn/mrkn256.vim'
NeoBundle 'Shougo/neosnippet.git'

"  vim-scripts repos
" -----------------------------------------------------------------------------
"NeoBundle 'L9'
"NeoBundle 'FuzzyFinder'
"NeoBundle 'rails.vim'

"  Non github repos
"  ----------------------------------------------------------------------------
"NeoBundle 'git://git.wincent.com/command-t.git'

"  Non git repos
" -----------------------------------------------------------------------------
NeoBundle 'http://github.com/Shougo/neocomplcache.git'

" ...
" -----------------------------------------------------------------------------


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
" -----------------------------------------------------------------------------
" mrkn256
" <https://github.com/mrkn/mrkn256.vim>
colorscheme mrkn256

" }}}

" vim: foldmethod=marker :
