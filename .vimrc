set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'vim-perl/vim-perl'

NeoBundle 'Lokaltog/vim-powerline'

NeoBundle 'Align'

filetype plugin indent on
filetype indent on
syntax on

colorscheme xoria256

set nobackup
set directory=~/swp
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

"let &statusline = ''
"let &statusline .= '%<[%n]%y%h%m%r%w %F'
"let &statusline .= '%='
"let &statusline .= ' [%{&l:fileencoding == "" ? &encoding : &l:fileencoding}:%{&fileformat}]'
"let &statusline .= ' %10.(%l,%c%V%) %P'

set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,utf-16,utf-16le

autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
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

nnoremap ,e :call ShebangExecute()<CR>
function! ShebangExecute()
    let m = matchlist(getline(1), '#!\(.*\)')
    if(len(m) > 2)
        execute '!'. m[1] . ' %'
    else
        execute '!' &ft ' %'
    endif
endfunction

let g:ref_perldoc_complete_head = 1

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
" }}}

" {{{ unite.vim
" The prefix key.
nnoremap [unite] <Nop>
nmap     f       [unite]

nnoremap          [unite]u :<C-u>Unite<Space>
nnoremap <silent> [unite]f :<C-u>UniteWithCurrentDir -buffer-name=files file buffer file_mru bookmark<CR>
nnoremap <silent> [unite]b :<C-u>Unite -buffer-name=files buffer_tab<CR>
nnoremap <silent> [unite]m :<C-u>Unite -buffer-name=files file_mru<CR>
nnoremap <silent> [unite]p :<C-u>Unite ref/perldoc<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.

  nmap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> jj    <Plug>(unite_insert_leave)
  "imap <buffer> <C-w> <Plug>(unite_delete_backward_path)

  " Start insert.
  "let g:unite_enable_start_insert = 1
endfunction"}}}

let g:unite_enable_start_insert = 1
let g:unite_update_time = 80
let g:unite_source_file_mru_limit = 5000
" }}}
