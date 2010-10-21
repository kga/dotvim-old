scriptencoding utf-8
syntax enable
set nocompatible

colorscheme xoria256

set nobackup
set foldmethod=marker
set textwidth=0
set ruler
set viminfo='100,<10000,s1000,\"1000
set backspace=indent,eol,start
set list
set listchars=tab:>\ ,trail:-
set scrolloff=10

set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set wildmode=list:longest,full
set modelines=0
set autoindent

set ignorecase
set smartcase
set wrapscan
set noincsearch
set showcmd
set showmatch
set hlsearch
set laststatus=2
set ambiwidth=double
set hidden
set autoread

let &statusline = ''
let &statusline .= '%<[%n]%y %F %h%m%r%w'
let &statusline .= '%='
let &statusline .= '[%{&l:fileencoding == "" ? &encoding : &l:fileencoding}:%{&fileformat}]'
let &statusline .= ' %10.(%l,%c%V%) %P'

set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,utf-16,utf-16le


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
