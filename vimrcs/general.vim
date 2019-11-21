" Author: Yist Lin

set incsearch  " search as characters are entered
set hlsearch   " highlight matches
set smartcase  " switch to case-sensitive when search query contains an uppercase letter

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

set confirm         " display a confirmation dialog when closing an unsaved file
set encoding=utf-8  " set characters encoding
set autoread        " re-read files if it's written outside
set backspace=indent,eol,start
