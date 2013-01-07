call pathogen#infect()

" change the mapleader from \ to , it's important that this
" is at/near the top of the file so that other mapped comamnds
" use this leader
let mapleader=","

"Helptags
syntax on
filetype plugin indent on

set encoding=utf-8
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start
set modeline
autocmd BufEnter * set relativenumber
set scrolloff=3
set cursorline
set ttyfast
set laststatus=2

set autoindent
set copyindent
set smartindent

set ignorecase
set smartcase

" Highlight search results as you type
set incsearch
set showmatch
set hlsearch

" global find/replace by default
set gdefault

" Manage line wrapping
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" Show commands in status bar
set showcmd

set title
set nobackup
set noswapfile

" Hides buffers instead of closing them, useful
" when opening other files and not having to save changes yet
set hidden

:command Upload :!upload.py %;

:command Wu w | Upload

" Open NERD tree if no files were specified when starting vim
autocmd vimenter * if !argc() | NERDTree | endif

" Use omnifunc for autocompletion
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete

""let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" Always show status line, even for one window
set laststatus=2
" " A more informative status line
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

" Toggle Nerd Tree plugin
nmap <leader>n :NERDTreeToggle<CR>

" Toggle fuzzy file/buffer search
nmap <leader>b :CtrlP<CR>

nmap <leader>a <Esc>:Ack!
nmap <leader>h :GundoToggle<CR>
nmap <leader>o :TagbarOpenAutoClose<CR>

" Easily clear out search highlighting
nnoremap <leader><space> :noh<cr>

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Remap window movements
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
