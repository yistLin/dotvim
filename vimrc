" Author: Yist Lin
" referred from https://dougblack.io/words/a-good-vimrc.html

set nocompatible  " required in VIM
filetype off      " required

" Vundle {{{
set rtp+=~/.vim/bundle/Vundle.vim  " runtime path to include Vundle
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'      " let Vundle manage Vundle (required)
Plugin 'itchyny/lightline.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'morhetz/gruvbox'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
call vundle#end()
" }}}

" Encoding {{{
set encoding=utf-8
set fileencodings=utf8,big5,big5-hkscs,gbk,latin1
" }}}

" Spaces & Tabs {{{
set smartindent
set tabstop=4      " number of visual spaces a tab
set shiftwidth=4   " Indents will have a width of 4
set softtabstop=4  " number of spaces for a tab
set expandtab      " expand tab to spaces
" }}}

" Colors {{{
syntax enable
set background=dark
colorscheme gruvbox
if (has("termguicolors"))
  set termguicolors
endif
" }}}

" UI {{{
filetype on         " turn on filetype detection
filetype indent on  " load indent/example.vim
filetype plugin on  " load ftplugin/example.vim
set number
set numberwidth=6
set wrap
set breakindent
set cursorline         " highlight current line
set showmatch          " highlight matching [{()}]
set laststatus=2       " display the status line
set display+=lastline  " always display the last line
" }}}

" Searching {{{
set incsearch  " search as characters are entered
set hlsearch   " highlight matches
" }}}

" Movement {{{

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" jump to beginning/end of line
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>

" move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" }}}

" Autogroups {{{
augroup configgroup

    autocmd!

    " load .vimrc source when saved
    autocmd BufWritePost .vimrc source $MYVIMRC

    " trim trailing spaces
    autocmd FileType c,cpp,python,javascript,html,tex autocmd BufWritePre <buffer> %s/\s\+$//e

    " set up filetype for special filetypes
    autocmd BufNewFile,BufRead *.ejs set filetype=html

    " set this if comment function not supported in vim-commentary
    " autocmd FileType apache setlocal commentstring=#\ %s

    " open NERDTree when vim starts up on opening a directory
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | wincmd w | endif

    " close vim if the only window left open is NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

augroup END
" }}}

" Backup {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}

" Command Line {{{
set showcmd   " show the last command entered in the bottom line
set wildmenu  " visual autocomplet for command menu
" }}}

" Commands Abbreviations {{{
cabbrev E Explore
" }}}

" Plugin: Lightline {{{
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ }
" }}}

" Plugin: NERDTree {{{

" delete the buffer of file which is deleted through NERDTree
let NERDTreeAutoDeleteBuffer = 1

" make it looks better
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" filter out some files
let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '\.vscode', '__pycache__']

" set up window size
let g:NERDTreeWinSize=25

" }}}

" Enable backspacing
set backspace=indent,eol,start

" Config the enhanced Python syntax
let python_highlight_all=1

" Check the last line for the Modelines (commands used only in this file)
set modelines=1
" vim:foldmethod=marker:foldlevel=0
