" .vimrc

" set nocp
set nocompatible

" Try out:
" --------
" set rnu
" set nornu
nnoremap <leader>r :set relativenumber<CR>
nnoremap <leader>R :set norelativenumber<CR>

" colorscheme ron

syntax enable
filetype indent on

" set nu sc cul wmnu sm lz
set number
set showcmd
set cursorline
set wildmenu
set showmatch
set lazyredraw

" set ts=4 sts=4 sw=4 et sta ai
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent

" set is hls
set incsearch
set hlsearch

" leader is \ by default
" let mapleader=","
" inoremap jk <esc>
nnoremap <leader><space> :nohlsearch<CR>

" set fen fdls=10 fdn=10 fdm=indent
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
" set foldmethod=manual
nnoremap <space> za

nnoremap j gj
nnoremap k gk
" nnoremap B ^
" nnoremap E $
" nnoremap gV `[v`]

map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

highlight ColorColumn ctermbg=green ctermfg=black
if exists('+colorcolumn')
    " set cc=80
    " let &cc="80,".join(range(100,999),",")
    set colorcolumn=80
endif

" nnoremap <f4> :w !time ./<c-r>% 
nnoremap <f5> :w<cr> :w !time ./%<cr>
" nnoremap <f6> :w<cr> : -o <c-r>%<c-w>out <c-r>% <home>w !
nnoremap t :w<cr>:!time bash %<cr>
