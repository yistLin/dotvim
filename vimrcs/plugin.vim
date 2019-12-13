" Author: Yist Lin

call plug#begin('~/.vim/plugged')

" A light and configurable statusline/tabline plugin for Vim
Plug 'itchyny/lightline.vim'

" Retro groove color scheme for Vim
Plug 'morhetz/gruvbox'

" commentary.vim: comment stuff out
Plug 'tpope/vim-commentary'

" Optimized Solarized colorschemes. Best served with true-color terminals!
Plug 'lifepillar/vim-solarized8'

" UltiSnips - The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips!
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" A solid language pack for Vim 
Plug 'sheerun/vim-polyglot'

" Light & Dark color schemes inspired by Google Material's Design
Plug 'NLKNguyen/papercolor-theme'

" An arctic, north-bluish clean and elegant Vim theme
Plug 'arcticicestudio/nord-vim'

" A dark theme for Vim
Plug 'dracula/vim'

" A vim plugin to display the indentation levels with thin vertical lines
Plug 'Yggdroot/indentLine'

" fugitive.vim: A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" vim-searchindex: display number of search matches & index of a current match
Plug 'google/vim-searchindex'

" *-Improved
Plug 'haya14busa/vim-asterisk'

" A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks and partial hunks.
Plug 'airblade/vim-gitgutter'

" A 24bit colorscheme for Vim, Airline and Lighline
Plug 'jacoborus/tender.vim'

" A code-completion engine for Vim
Plug 'ycm-core/YouCompleteMe'

call plug#end()

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

" Plugin: indentLine {{{
let g:indentLine_char = '┊'
let g:indentLine_setConceal = 0
" }}}

" Plugin: YouCompleteMe {{{
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" }}}

" Plugin: UltiSnips {{{
let g:UltiSnipsSnippetsDir=$HOME.'/.vim/UltiSnips/'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsListSnippets="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
" }}}

" Plugin: vim-asterisk {{{
map *  <Plug>(asterisk-z*)
map #  <Plug>(asterisk-z#)
map g* <Plug>(asterisk-gz*)
map g# <Plug>(asterisk-gz#)
" }}}
