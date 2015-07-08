" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'vim-perl/vim-perl'
NeoBundle 'motemen/xslate-vim'
NeoBundle 'groenewege/vim-less'

NeoBundle 'Align'
NeoBundle 'sudo.vim'
NeoBundle 'sorah/unite-ghq'
NeoBundle 'tpope/vim-fugitive'

NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'Shutnik/jshint2.vim'

NeoBundle 'fatih/vim-go'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'derekwyatt/vim-scala'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

let jshint2_save = 1

autocmd QuickFixCmdPost *grep* cwindow

filetype plugin indent on
filetype indent on
syntax on

NeoBundle 'tomasr/molokai'
colorscheme molokai

set nobackup
set directory=~/.vim/swp
set textwidth=0
set ruler
set viminfo='100,<10000,s1000,\"1000
set backspace=indent,eol,start
set list
set listchars=tab:>\ ,trail:-
set scrolloff=10
set display=lastline
set foldenable
set foldmethod=marker
"set clipboard+=unnamed
set visualbell
set t_vb=

set number

set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set wildmode=list:longest,full
set wildmenu
set modelines=0
set autoindent

set ignorecase
set smartcase
set wrapscan
set noincsearch
set showcmd
set showmatch
set matchpairs+=<:>
set hlsearch
set laststatus=2
set ambiwidth=double
set hidden
"set autoread
"set whichwrap=b,s,h,l,<,>,[,]

let loaded_matchparen = 1

let &statusline = ''
let &statusline .= '%<[%n]%y%h%m%r%w %F'
let &statusline .= '%='
let &statusline .= ' [%{&l:fileencoding == "" ? &encoding : &l:fileencoding}:%{&fileformat}]'
let &statusline .= ' %10.(%l,%c%V%) %P'

set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,utf-16,utf-16le

"autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | silent! exe '!echo -n "kv:%\\"' | endif

cnoremap <C-a> <Home>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-d> <Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap <silent> eu :setlocal fileencoding=utf-8<CR>
nnoremap <silent> es :setlocal fileencoding=cp932<CR>
nnoremap <silent> ee :setlocal fileencoding=euc-jp<CR>

nnoremap <silent> eru :e ++enc=utf-8 %<CR>
nnoremap <silent> ere :e ++enc=euc-jp %<CR>
nnoremap <silent> ers :e ++enc=cp932 %<CR>

vnoremap <silent> <Space>a :Align =><CR>
nnoremap <silent> <Space>/ :nohlsearch<CR>

nnoremap <expr> 0 col('.') == 1 ? '^' : '0'

let g:ref_perldoc_complete_head = 1

nnoremap <silent> ,r :<C-u>QuickRun -runner vimproc<CR>
let g:quickrun_config = {}
"let g:quickrun_config.perl = { 'command': 'perl', 'cmdopt': '-MProject::Libs' }

let g:quickrun_config.perl = {
\   'cmdopt': '-Ilib -It -MProject::Libs',
\   'hook/cd/directory': '%{fnamemodify(finddir(".cpanfile", ".;"), ":h")}',
\   'exec': 'carton exec perl %o %s:p %a',
\}


" {{{ neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 2

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
\ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
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

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

" http://hakobe932.hatenablog.com/entry/2014/01/21/214100
if !exists('g:neocomplcache_delimiter_patterns')
    let g:neocomplcache_delimiter_patterns = {}
endif
let g:neocomplcache_delimiter_patterns['perl'] = []
" }}}

" {{{ unite.vim
" The prefix key.
nnoremap [unite] <Nop>
nmap     f       [unite]

nnoremap          [unite]u :<C-u>Unite<Space>
nnoremap <silent> [unite]f :<C-u>UniteWithCurrentDir file file/new buffer file_mru bookmark<CR>
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]p :<C-u>Unite ref/perldoc<CR>
nnoremap <silent> [unite]e :<C-u>call DispatchUniteFileRecAsyncOrGit()<CR>
nnoremap <silent> [unite]g :<C-u>Unite ghq<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.

  nmap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> jj    <Plug>(unite_insert_leave)
  "imap <buffer> <C-w> <Plug>(unite_delete_backward_path)

  " Start insert.
  "let g:unite_enable_start_insert = 1
endfunction"}}}

function! DispatchUniteFileRecAsyncOrGit()"{{{
  if isdirectory(getcwd()."/.git")
    Unite file_rec/git:!
  else
    Unite file_rec/async:!
  endif
endfunction"}}}

let g:unite_enable_start_insert = 1
let g:unite_update_time = 80
let g:unite_source_file_mru_limit = 5000

call unite#custom#source('file_rec/async', 'ignore_pattern', '\%(png\|gif\|jpeg\|jpg\)$')
" }}}

let g:wildfire_fuel_map = "<ENTER>"
