"
" Plugin settings
"

" CtrlP
" =====

let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_extensions = ['line', 'tag', 'dir']

" Use 'The Silver Searcher' when available.
if executable('ag')
  " List files with `ag`
  let g:ctrlp_user_command = 'ag -Q -l -g "" --ignore tmp --nocolor %s'

  " `ag` is fast enought to make caching unnecesary
  let g:ctrlp_use_caching = 0
endif


" EasyAlign
" =========

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)


" Fugitive
" ========

" Open git status view to the right
nnoremap <Leader>g :Gstatus<CR><C-w>L


" GitGutter
" =========

" Disabled by default
let g:gitgutter_enabled = 0

" Toggle GitGutter
nnoremap <C-g> :GitGutterToggle<CR>
nnoremap [h    :GitGutterPrevHunk<CR>
nnoremap ]h    :GitGutterNextHunk<CR>


" html5.vim
" =========

" Patch, no syntax highlighting without this line
au BufReadPost *.html set syntax=html


" netrw
" =====

" netrw history and bookmarks directory
let g:netrw_home = '~/.vim/tmp'


" Undotree
" ========

nnoremap <F5> :UndotreeToggle<cr>
