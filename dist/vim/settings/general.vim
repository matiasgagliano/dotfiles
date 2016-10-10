"
" General settings
"

" Put swap (.swp) and backup files in a central location (fallback to /tmp).
" Use double trailing slashes in the paths to tell vim to avoid name collisions.
set directory=~/.vim/tmp/backup//,/tmp//
set backupdir=~/.vim/tmp/backup//,/tmp//

" Maintain undo history between sessions
if has('persistent_undo')
  set undofile
  set undodir=~/.vim/tmp/undo//
endif

" Use The Silver Searcher instead of `grep` when available.
" https://github.com/ggreer/the_silver_searcher
if executable('ag')
  set grepprg="ag --nogroup --nocolor"
endif

" Automatically read again files that have changed outside of Vim
set autoread
