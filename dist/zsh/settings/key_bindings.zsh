#
# Key bindings
#

# Load terminfo, database describing terminals (see `man 5 terminfo`)
zmodload zsh/terminfo

# Make sure that the terminal is in "application" mode when zle is active,
# otherwise terminfo values won't be valid.
#
# http://zshwiki.org/home/zle/bindkeys
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html (18.5.1 Special Widgets)
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  zle-line-init()   { echoti smkx }  # Enter 'key‐board_transmit' mode
  zle-line-finish() { echoti rmkx }  # Leave 'key‐board_transmit' mode
  zle -N zle-line-init               # Hook after zle starts reading a new line.
  zle -N zle-line-finish             # Hook after zle finishes reading a line.
fi

# Custom function to bind keys in multiple modes at the same time.
# Flags: -e (emacs), -i (viins), -c (vicmd).
autoload -Uz 'bind'

# Load key code cache ($key) for special keys (Ctrl, Esc, PageUp, etc.)
source "${ZSH}/settings/key_list.zsh"

# Set leader key for vi command mode.
LEADER=' '



# General
# =======

# Enable vi-mode (Vim key bindings)
bindkey -v

# The time the shell waits (in hundredths of seconds) for another
# key to be pressed when reading bound multi-character sequences.
KEYTIMEOUT=15

# [v] Edit the current line in the default editor
autoload -Uz edit-command-line
zle -N edit-command-line
bind -c 'v' edit-command-line

# [<leader>-h] Get help for the command in the current input (`run-help` widget)
bind -c "${LEADER}h" run-help



# History
# =======

# <Ctrl-r> [/] Search backward incrementally.
# The string may begin with ^ to anchor the search to the beginning of the line.
bind -ei "${key[Ctrl]}r" history-incremental-search-backward
bind -c  '/'             history-incremental-search-backward

# <Up> <Down> [k] [j] Fuzzy find history (plugin).
bind -ei $key[Up]   history-substring-search-up
bind -ei $key[Down] history-substring-search-down
bind -c  'k'        history-substring-search-up
bind -c  'j'        history-substring-search-down



# Completion
# ==========

# <Shift-Tab> Move through the completion menu backwards
bind -ei $key[BackTab] reverse-menu-complete

# <Ctrl-e> Expand aliases
glob_alias() { zle _expand_alias }
zle -N glob_alias
bind -ei "${key[Ctrl]}e" glob_alias


# Vi mode
# =======
#
# 'vi-' prefixed widgets don't continue to the previous/following line.
#
# Replace widgets that in insert mode don't allow passing the point
# where insert mode was last entered, like 'vi-backward-delete-char'.

bind -ei  $key[BackSpace] backward-delete-char
bind -c   $key[BackSpace] vi-backward-char
bind -e   $key[Home]      beginning-of-line
bind -ic  $key[Home]      vi-beginning-of-line
bind -ei  $key[Insert]    overwrite-mode
bind -c   $key[Insert]    vi-insert
bind -eic $key[Delete]    delete-char
