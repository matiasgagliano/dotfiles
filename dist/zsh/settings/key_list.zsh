#
# Key list (cache of special keys using terminfo)
#

typeset -A key
key=(
  Ctrl       '\C-'
  Esc        '\e'
  Meta       '\M-'
  Tab        '^I'
  BackTab    "${terminfo[kcbt]}"  # <Shif-Tab>
  BackSpace  "${terminfo[kbs]}"
  Up         "${terminfo[kcuu1]}"
  Down       "${terminfo[kcud1]}"
  Left       "${terminfo[kcub1]}"
  Right      "${terminfo[kcuf1]}"
  Home       "${terminfo[khome]}"
  End        "${terminfo[kend]}"
  Insert     "${terminfo[kich1]}"
  Delete     "${terminfo[kdch1]}"
  PageUp     "${terminfo[kpp]}"
  PageDown   "${terminfo[knp]}"
  F1         "${terminfo[kf1]}"
  F2         "${terminfo[kf2]}"
  F3         "${terminfo[kf3]}"
  F4         "${terminfo[kf4]}"
  F5         "${terminfo[kf5]}"
  F6         "${terminfo[kf6]}"
  F7         "${terminfo[kf7]}"
  F8         "${terminfo[kf8]}"
  F9         "${terminfo[kf9]}"
  F10        "${terminfo[kf10]}"
  F11        "${terminfo[kf11]}"
  F12        "${terminfo[kf12]}"
)
