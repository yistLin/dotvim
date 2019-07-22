" Author: Yist Lin

set nocompatible    " be iMproved, required
filetype off    " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'itchyny/lightline.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'morhetz/gruvbox'

" All of your Plugins must be added before the following line
call vundle#end()

" Set up filetype detection
filetype plugin indent on

" Set up encoding
set encoding=utf-8
set fileencodings=utf8,big5,big5-hkscs,gbk,latin1

" Backup & History
set nobackup
set nowritebackup
set history=50		" keep 50 lines of command line history

" Display incomplete commands
set showcmd

" Searching
set incsearch
set hlsearch

" Color scheme
set t_Co=256

if (has("termguicolors"))
  set termguicolors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

syntax enable
set background=dark
colorscheme gruvbox

highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch
endif

" Set up Pathogen
" execute pathogen#infect()

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Set File type to 'text' for files ending in .txt
  autocmd BufNewFile,BufRead *.txt setfiletype text

  " Enable Python code auto complete by Omni Auto Complete
  autocmd FileType python set omnifunc=pythoncomplete#Complete tabstop=8 shiftwidth=4 softtabstop=4 autoindent expandtab

  " Enable soft-wrapping for text files
  autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " Automatically load .vimrc source when saved
  autocmd BufWritePost .vimrc source $MYVIMRC

  " Automatically trim trailing spaces
  autocmd FileType c,cpp,python,javascript,html,tex autocmd BufWritePre <buffer> %s/\s\+$//e

  " Automatically set up filetype for special filetypes
  autocmd BufNewFile,BufRead *.ejs set filetype=html

  augroup END

endif

" Always display the status line
set laststatus=2

" Display the last line even if it's longer than a single line
set display+=lastline

" Abbreviate commands
cabbrev E Explore

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor\ --ignore-dir=tmp\ --ignore-dir=coverage
endif

" Numbers
set number
set numberwidth=6

" case only matters with mixed case expressions
set ignorecase
set smartcase

" VIM underline the current line
set cursorline

" Fix backspace
set bs=2

" Set indentation
set smartindent
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.

" Set up auto-wrap
set wrap
set linebreak
set breakindent
" set showbreak=

" Set up lightline
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ }

let python_highlight_all=1

set directory=.
