"
" General mappings
"
" Use `:map [keycombo]` (e.g. `:map <C-g>`) to see what a key combo
" is mapped to. Use `:verbose map [keycombo]` to also see where the
" mapping was set, if the key combo is omitted a list of all mappings
" is shown (also available for nmap, imap, vmap, etc.).

" Leader
let mapleader=' '


" Disabled
" ========

" No arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Disable K looking stuff up
map K <Nop>


" Windows
" =======

" Split windows
nnoremap <Leader>- :split<CR><C-w>j
nnoremap <Leader><Bar> :vsplit<CR><C-w>l

" Move splits
" (change location of current split)
nnoremap <Leader>J <C-w>J
nnoremap <Leader>K <C-w>K
nnoremap <Leader>H <C-w>H
nnoremap <Leader>L <C-w>L

" Move around splits
" (move cursor to a another split)
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l

" Resize windows
nnoremap <C-j> <C-w>-
nnoremap <C-k> <C-w>+
nnoremap <C-h> <C-w><
nnoremap <C-l> <C-w>>


" Tabs
" ====

" New tab
nnoremap <Leader>t :tabnew<CR>

" Move current split into a new tab
nnoremap <Leader>T <C-w>T

" Go to nth tab
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt
nnoremap <Leader>0 :tablast<CR>


" Toogles
" =======

" Toogle line numbers (absoulte and relative)
noremap <C-n> :set number! relativenumber!<CR>

" Toggle spell checking
noremap <F7> :setlocal spell! spell?<CR>
vnoremap <F7> <C-c>:setlocal spell! spell?<CR>
inoremap <F7> <C-o>:setlocal spell! spell?<CR>

" Toggle paste mode
set pastetoggle=<C-p>


" Utilities
" =========

" Add new line and return to normal mode
nnoremap <Leader><CR> o<Esc>

" Turn off highlighting of current search and clear messages.
nnoremap <silent><Leader><Space> :nohlsearch<Bar>:echo<CR>

" Use Ctrl-s for saving, also in Insert mode
" Set 'stty stop undef' in the terminal to prevent Ctrl+s from freezing the terminal
noremap  <C-s> :update<CR>
vnoremap <C-s> <C-c>:update<CR>
inoremap <C-s> <C-o>:update<CR>

" Quit shortcuts
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :x<CR>

" Make the current window the only one on the screen
" nnoremap <Leader>o :only<CR>

" Use `w!!` to save with sudo
cmap w!! w !sudo tee > /dev/null %
