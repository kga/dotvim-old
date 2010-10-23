scriptencoding utf-8

language messages C

syntax enable
set nocompatible

call pathogen#runtime_append_all_bundles()

filetype plugin indent on

colorscheme xoria256

set nobackup
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
set matchpairs+=<:>
set hlsearch
set laststatus=2
set ambiwidth=double
set hidden
"set autoread

let &statusline = ''
let &statusline .= '%<[%n]%y%h%m%r%w %F'
let &statusline .= '%='
let &statusline .= ' [%{&l:fileencoding == "" ? &encoding : &l:fileencoding}:%{&fileformat}]'
let &statusline .= ' %10.(%l,%c%V%) %P'

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


" FuzzyFinder
let g:fuf_modesDisable = []
let g:fuf_ignoreCase = 1
let g:fuf_enumeratingLimit = 30
let g:fuf_mrufile_maxItem = 5000
let g:fuf_keyPreview = '<C-]>'
nnoremap <silent> fb :FufBuffer<CR>
nnoremap <silent> fm :FufMruFile<CR>
nnoremap <silent> ff :FufFile<CR>
nnoremap <silent> fF :FufFile <C-r>=expand('%:~:.')[:-1-len(expand('%:~:.:t'))]<CR><CR>
