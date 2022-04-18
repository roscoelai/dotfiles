" .vimrc ( or _gvimrc )
" 2022-03-12

set nocompatible " nocp ( redundant? )

syntax enable
filetype indent on

" leader is \ by default
" let mapleader=","

if has("gui_running")
    colorscheme darkblue
    set guifont=Consolas:h10:cANSI
    set columns=110 " co=110
    set lines=40
else
    colorscheme ron
    nnoremap <f4> :w<cr> :! time %:p
    nnoremap <f5> :w<cr> :! time %:p<cr>
    " nnoremap <f5> :w<cr> :w !time ./%<cr>
    " nnoremap t :w<cr> :! time bash %<cr>
endif

highlight ColorColumn ctermbg=green ctermfg=black guibg=darkgreen
if exists("+colorcolumn")
    set colorcolumn=80 " cc=80
    " let &cc="80,".join(range(100,999),",")
endif

" ( new! ) Trying out
" set relativenumber " rnu
nnoremap <leader>r :set relativenumber<cr>
nnoremap <leader>R :set norelativenumber<cr>

set number " nu
set showcmd " sc
set cursorline " cul
set wildmenu " wmnu
set showmatch " sm
set lazyredraw " lz

set tabstop=4 " ts=4
set softtabstop=4 " sts=4
set shiftwidth=4 " sw=4
set expandtab " et
set smarttab " sta
set autoindent " ai

set incsearch " is
set hlsearch " hls
nnoremap <leader><space> :nohlsearch<cr>

set foldenable " fen
set foldlevelstart=10 " fdls=10
set foldnestmax=10 " fdn=10
set foldmethod=indent " fdm=indent
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
map <c-tab> :bnext<cr>
map <c-s-tab> :bprevious<cr>
" inoremap jk <esc>



