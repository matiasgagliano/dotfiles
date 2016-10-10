"
" Detect filetypes by inspecting file content
" See :h new-filetype-scripts
"

" filetype already set, don't do these checks
if did_filetype()
  finish

" Node binary
elseif getline(1) =~ '^#.*\<node\>'
  setfiletype javascript
endif
