set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/vimproc.vim'

Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'thinca/vim-quickrun'
Plugin 'thinca/vim-ref'
Plugin 'vim-perl/vim-perl'
Plugin 'motemen/xslate-vim'
Plugin 'groenewege/vim-less'

Plugin 'Align'
Plugin 'sudo.vim'
Plugin 'sorah/unite-ghq'
Plugin 'tpope/vim-fugitive'

Plugin 'Shutnik/jshint2.vim'

Plugin 'fatih/vim-go'
Plugin 'mxw/vim-jsx'
Plugin 'leafgarland/typescript-vim'
Plugin 'derekwyatt/vim-scala'

Plugin 'tomasr/molokai'
Plugin 'keith/swift.vim'
colorscheme molokai

call vundle#end()

filetype plugin indent on

let jshint2_save = 1

autocmd QuickFixCmdPost *grep* cwindow

filetype plugin indent on
filetype indent on
syntax on


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

let g:ref_perldoc_complete_head = 0

nnoremap <silent> ,r :<C-u>QuickRun -runner vimproc<CR>
let g:quickrun_config = {}
"let g:quickrun_config.perl = { 'command': 'perl', 'cmdopt': '-MProject::Libs' }

let g:quickrun_config.perl = {
\   'cmdopt': '-Ilib -It -MProject::Libs',
\   'hook/cd/directory': '%{fnamemodify(finddir(".cpanfile", ".;"), ":h")}',
\   'exec': 'carton exec perl %o %s:p %a',
\}


" {{{ neocomplete
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Set minimum syntax keyword length.
let g:neocomplete#min_keyword_length = 2

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : ''
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

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl =
\ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

" http://hakobe932.hatenablog.com/entry/2014/01/21/214100
if !exists('g:neocomplete#delimiter_patterns')
  let g:neocomplete#delimiter_patterns = {}
endif
let g:neocomplete#delimiter_patterns.perl = []

let g:neosnippet#snippets_directory = '~/.vim/snippets/'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

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

" {{{ neosnippets
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
"let g:neosnippet#disable_runtime_snippets = {
"\   '_' : 1,
"\ }
"let g:neosnippet#snippets_directory='~/.vim/snippets'
" }}}

let g:wildfire_fuel_map = "<ENTER>"
