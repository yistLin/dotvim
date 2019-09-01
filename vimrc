" Author: Yist Lin

if has('vim')
    set nocompatible  " required in VIM
endif

" vim-plug {{{
if has('nvim')
    call plug#begin('~/.local/share/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

" A light and configurable statusline/tabline plugin for Vim
Plug 'itchyny/lightline.vim'

" vim-snipmate default snippets (Previously snipmate-snippets)
Plug 'honza/vim-snippets'

" Retro groove color scheme for Vim
Plug 'morhetz/gruvbox'

" True Sublime Text style multiple selections for Vim
Plug 'terryma/vim-multiple-cursors'

" commentary.vim: comment stuff out
Plug 'tpope/vim-commentary'

" Optimized Solarized colorschemes. Best served with true-color terminals!
Plug 'lifepillar/vim-solarized8'

" Dark powered asynchronous completion framework for neovim/Vim8
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" A solid language pack for Vim 
Plug 'sheerun/vim-polyglot'

" deoplete.nvim source for Python
Plug 'deoplete-plugins/deoplete-jedi'

" Base16 for Vim
Plug 'chriskempson/base16-vim'

" Light & Dark color schemes inspired by Google Material's Design
Plug 'NLKNguyen/papercolor-theme'

call plug#end()
" }}}

" Plugin: Lightline {{{
let g:lightline = {
    \ 'active': {
    \     'left': [ [ 'mode', 'paste' ],
    \               [ 'readonly', 'filename', 'modified' ] ],
    \     'right': [ [ 'percent' ],
    \                [ 'fileformat', 'fileencoding', 'filetype' ] ]
    \ },
    \ 'component_function': {
    \     'fileformat': 'LightlineFileformat',
    \     'filetype': 'LightlineFiletype',
    \     'fileencoding': 'LightlineFileencoding',
    \ },
    \ }

function! LightlineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
    return winwidth(0) > 70 ? &fileencoding : ''
endfunction
" }}}

" Plugin: deoplete.nvim {{{
let g:deoplete#enable_at_startup = 1
" }}}

" Plugin: netrw {{{
let g:netrw_banner = 0
let g:netrw_preview = 1
let g:netrw_winsize = 30
let g:netrw_liststyle = 3
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

" Detect whether shell is through Mosh or not
function! s:is_mosh()
    let output = system("is-mosh -v")
    if v:shell_error
        return 0
    endif
    return !empty(l:output)
endfunction

" Turn off 24-bits color when shell is through Mosh
function s:auto_termguicolors()
    if !(has("termguicolors"))
        return
    endif
    if (&term == 'xterm-256color' || &term == 'nvim') && !s:is_mosh()
        set termguicolors
        colorscheme solarized8_flat
        let g:lightline.colorscheme = "solarized"
    else
        set notermguicolors
        set background=light
        colorscheme PaperColor
        let g:lightline.colorscheme = "PaperColor"
    endif
endfunction

call s:auto_termguicolors()
" }}}

" User Interface {{{
set number
set numberwidth=6
set showmatch     " highlight matching [{()}]
set laststatus=2  " display the status line
set noshowmode    " no need to show mode while using lightline
set noerrorbells  " disable beep on errors.
set visualbell    " flash the screen instead of beeping on errors
set showcmd       " show the last command entered in the bottom line
set wildmenu      " visual autocomplete for command menu
set wildignore=*.swp,*.bak,*.pyc,*.class
" }}}

" Text Rendering {{{
set fileencodings=utf8,big5,big5-hkscs,gbk,latin1
filetype on            " turn on filetype detection
filetype indent on     " load indent/example.vim
filetype plugin on     " load ftplugin/example.vim
set display+=lastline  " always display the last line
set wrap
set breakindent        " give indent to wrapped lines
set foldmethod=marker
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

    " trim trailing spaces
    autocmd FileType c,cpp,python,javascript,html,tex autocmd BufWritePre <buffer> %s/\s\+$//e

    " set up filetype for special filetypes
    autocmd BufNewFile,BufRead *.ejs set filetype=html

    " jump to the last edited position
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

    " close the auto-completion windows when it is done
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

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
let mapleader=","
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>e :Explore<CR>

" recording is useless to me currently
nnoremap q <nop>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" create and move between tabs
nnoremap tn :tabnew<CR>
nnoremap th :tabprev<CR>
nnoremap tl :tabnext<CR>
nnoremap to :tabonly<CR>
nnoremap td :tabclose<CR>
nnoremap tt :<C-U>execute "normal! " . v:count . "gt"<CR>

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
