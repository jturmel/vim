set nocp

let g:pathogen_disabled = ['auto-pairs']

call pathogen#infect()

" change the mapleader from \ to , it's important that this
" is at/near the top of the file so that other mapped comamnds
" use this leader
let mapleader=","

"Helptags
filetype off
filetype plugin indent on
syntax on

syntax enable
set background=dark
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

"autocmd BufEnter * set relativenumber
set backspace=indent,eol,start
set cursorline
set encoding=utf-8
set expandtab
set laststatus=2
set modeline
set number
set scrolloff=3
set shiftwidth=4
set softtabstop=4
set tabstop=4
set ttyfast "Improved redrawing
set history=1000

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
:autocmd BufNewFile,BufRead *.rst set nowrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80

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
nmap <leader>p :NERDTreeToggle<CR>

" Toggle fuzzy file/buffer search
"nmap <leader>b :CtrlP<CR>
nmap <leader>b :CtrlPMixed<CR>
nmap <leader>h :CtrlPBufTagAll<CR>
"let g:ctrlp_match_window_reversed = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_mruf_case_sensitive = 0
let g:ctrlp_mruf_relative = 1
"let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                          "\ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
let g:ctrlp_extensions = ['buffertag']

nmap <leader>a <ESC>:Ack!
"nmap <leader>h :GundoToggle<CR>
nmap <leader>o :TagbarOpenAutoClose<CR>
map <leader>s :sort<CR>

" Easily clear out search highlighting
nnoremap <leader><space> :noh<cr>

" Go to next quickfix result
nnoremap <leader>n :cn<CR>

" Close quickfix result window
nnoremap <leader>c :ccl<CR>

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Delete trailing white space on save, useful for Python
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.php :call DeleteTrailingWS()

" Remap window movements
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

set exrc
set secure

"Powerline
source /Users/jturmel/.pythonbrew/pythons/Python-2.7.3/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim

let g:pymode_folding = 0
let g:pymode_rope_autoimport_generate = 1
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_utils_whitespaces = 0
let g:pymode_breakpoint = 0

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

:nmap <leader>t "=strftime('%s')<C-M>p"

let NERDTreeIgnore = ['\.pyc$']

aug SmartDiffType
    au!
    au VimEnter * :if &diff && len(&ft) | call setwinvar(2/winnr(),'&ft',&ft) | elseif &diff | let &ft=getwinvar(2/winnr(),'&ft') | endif
aug END

"nnoremap ; o<Esc>

nmap <leader>r <Plug>SetTmuxVars
"nmap <leader>T :Tmux jasmine-node api/3.1/timeline<CR>

let g:NERDTreeWinSize = 28
