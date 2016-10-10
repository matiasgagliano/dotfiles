"
" Status line settings
"

" Always display status lines
set laststatus=2

" Plane status line
" set statusline=%#erro#%F\ %m%y%=%l/%L\ %P

" Statusline with lightline plugin
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'filename', 'readonly', 'modified' ],
  \             ['ctrlpmark'] ]
  \ },
  \ 'component': {
  \   'readonly': '%{&readonly ? "\ue0a2" : ""}',
  \   'modified': '%{&modified ? "+" : ""}',
  \   'fugitive': '%{winwidth(0)>70 && ""!=fugitive#head() ? "\ue0a0".fugitive#head() : ""}',
  \   'fileformat': '%{winwidth(0)>70 ? &fileformat : ""}',
  \   'fileencoding': '%{winwidth(0)>70 ? (""!=&fenc ? &fenc : &enc) : ""}',
  \   'filetype': '%{winwidth(0)>70 ? (""!=&filetype ? &filetype : "no ft") : ""}'
  \ },
  \ 'component_function': {
  \   'ctrlpmark': 'CtrlpMark'
  \ },
  \ 'component_visible_condition': {
  \   'readonly': '&readonly',
  \   'modified': '&modified',
  \   'fugitive': '(winwidth(0)>70 && exists("*fugitive#head") && ""!=fugitive#head())'
  \ },
  \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
  \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
\ }



" CtrlP
" =====

function! CtrlpMark()
  if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return g:lightline.ctrlp_item
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlpMainStatus',
  \ 'prog': 'CtrlpProgressStatus',
\ }

function! CtrlpMainStatus(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_item = a:item
  return lightline#statusline(0)
endfunction

function! CtrlpProgressStatus(str)
  return lightline#statusline(0)
endfunction
