" Author: Yist Lin
" based on https://dougblack.io/words/a-good-vimrc.html

set nocompatible  " required in VIM
filetype off      " required by Vundle

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
Plugin 'godlygeek/tabular'
Plugin 'lifepillar/vim-solarized8'
Plugin 'mileszs/ack.vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
call vundle#end()
" }}}

" Spaces & Tabs {{{
set autoindent     " copy indent when starting a new line
set expandtab      " expand tab to spaces
set smarttab       " insert 'tabstop' number of spaces pressing tab
set tabstop=4      " number of visual spaces a tab
set softtabstop=4  " number of spaces for a tab
set shiftwidth=4   " while shifting, indents will have a width of 4
set shiftround     " while shifting, round indentation to the nearest multiple of shiftwidth.
" }}}

" Colors {{{
syntax enable
if (has("termguicolors"))
    set termguicolors
    " set Vim-specific sequences for RGB colors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
set background=dark
colorscheme solarized8_flat
" }}}

" User Interface {{{
set number
set numberwidth=6
set cursorline    " highlight current line
set showmatch     " highlight matching [{()}]
set laststatus=2  " display the status line
set noshowmode    " no need to show mode while using lightline
set noerrorbells  " disable beep on errors.
set visualbell    " flash the screen instead of beeping on errors
set showcmd       " show the last command entered in the bottom line
set wildmenu      " visual autocomplet for command menu
" }}}

" Text Rendering {{{
set fileencodings=utf8,big5,big5-hkscs,gbk,latin1
filetype on            " turn on filetype detection
filetype indent on     " load indent/example.vim
filetype plugin on     " load ftplugin/example.vim
set display+=lastline  " always display the last line
set wrap
set breakindent        " give indent to wrapped lines
" }}}

" Searching {{{
set incsearch  " search as characters are entered
set hlsearch   " highlight matches
set smartcase  " switch to case-sensitive when search query contains an uppercase letter
" }}}

" Autogroups {{{
augroup configgroup

    " clean out all previous commands
    autocmd!

    " load .vimrc source when saved
    autocmd BufWritePost .vimrc source $MYVIMRC

    " trim trailing spaces
    autocmd FileType c,cpp,python,javascript,html,tex autocmd BufWritePre <buffer> %s/\s\+$//e

    " set up filetype for special filetypes
    autocmd BufNewFile,BufRead *.ejs set filetype=html

    " jump to the last edited position
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

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

" Remapping {{{
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

" map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
" }}}

" Miscellaneous Options {{{
set confirm         " display a confirmation dialog when closing an unsaved file
set encoding=utf-8  " set characters encoding
set autoread        " re-read files if it's written outside
set backspace=indent,eol,start
" }}}

" Plugin: Lightline {{{
let g:lightline = {
  \ 'colorscheme': 'solarized',
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

" Plugin: ack.vim {{{
cnoreabbrev ag Ack
if executable('ag')
  let g:ackprg='ag --nogroup --nocolor --column'
endif
" }}}

" Plugin: UltiSnips {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" }}}

" Plugin: deoplete.nvim {{{
set pyxversion=3
let g:python3_host_prog="/usr/local/bin/python3"
let g:deoplete#enable_at_startup=1
" }}}

" Check the last line for the Modelines
set modelines=1
" vim:foldmethod=marker:foldlevel=0
