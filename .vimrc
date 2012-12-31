call pathogen#infect()

"Helptags
syntax on
filetype plugin indent on
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start
set modeline

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

let g:SuperTabDefaultCompletionType = "context"

set autoindent
set copyindent
set smartindent

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
map <F4> :NERDTreeToggle<CR>

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

