" Author: Yist Lin

filetype on            " turn on filetype detection
filetype indent on     " load indent/example.vim
filetype plugin on     " load ftplugin/example.vim

augroup configgroup

    " clean out all previous commands
    autocmd!

    " trim trailing spaces
    autocmd FileType c,cpp,python,javascript,html,tex autocmd BufWritePre <buffer> %s/\s\+$//e

    " set up filetype for special filetypes
    autocmd BufNewFile,BufRead *.ejs set filetype=html

    " jump to the last edited position
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

augroup END

let g:tex_flavor = "latex"  " see .tex file as latex instead of plaintex
let g:tex_conceal = ''
