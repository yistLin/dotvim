" Author: Yist Lin

let mapleader=","
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>h :noh<CR>

" mark a word as good and add it to my spellfile
nnoremap <leader>a zg

" toggle spell check
nnoremap <leader>s :setlocal spell! spell?<CR>

" toggle folding
nnoremap <leader>f zi

" vim-fugitive functions
nnoremap <leader>l :Gclog<CR>
nnoremap <leader>d :Gdiffsplit<CR>

" paste from yank register (won't be affected by default register)
map <leader>p "0p
map <leader>P "0P

" comment quickly with vim-commentary
nnoremap <C-_> :Commentary<CR>
vnoremap <C-_> :Commentary<CR>

" close quickfix
nnoremap <leader>c :ccl<CR>

" toggle folding by pressing space bar twice
nnoremap <silent><Space> za

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move half page up/down with j, k
nnoremap J 5j
nnoremap K 5k

" retain the visual selection after shifting
vnoremap > >gv
vnoremap < <gv

" move lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" create and move between tabs
nnoremap tp :tabprev<CR>
nnoremap tn :tabnext<CR>
nnoremap to :tabonly<CR>
nnoremap <expr> tt (v:count == 0 ? ":tabnew<CR>"   : ":<C-U>execute v:count 'tabnext'<CR>")
nnoremap <expr> tq (v:count == 0 ? ":tabclose<CR>" : ":<C-U>execute v:count 'tabclose'<CR>")
