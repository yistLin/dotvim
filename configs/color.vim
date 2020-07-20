" Author: Yist Lin

syntax enable

if has("termguicolors")
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

set background=dark
" set background=light

" let g:gruvbox_italic=1
" let g:gruvbox_contrast_dark="hard"
" colorscheme gruvbox
colorscheme solarized8
" colorscheme solarized8_high
" colorscheme tender

" let g:lightline.colorscheme = "gruvbox"
let g:lightline.colorscheme = "solarized"
