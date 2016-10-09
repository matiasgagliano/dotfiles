#
# History
#

# Variables
# =========

HISTSIZE=10000                  # Maximum number of events to save in the internal history.
SAVEHIST=10000                  # Maximum number of events to save in the history file.
HISTFILE="${ZSH_TMP}/history"   # Path to the history file.


# Options
# =======
# [history options](http://zsh.sourceforge.net/Guide/zshguide02.html#l18)

setopt bang_hist                # Enable bang-history (use of !!, etc.).
setopt extended_history         # Save timestamps too, format ":start:elapsed:command".
setopt hist_verify              # Reload the line instead of executing it.
setopt hist_beep                # Beep when scrolling beyond an end of the history list.

setopt append_history           # Append to the history file instead of overwriting it.
setopt inc_append_history       # Write history with each line, not when the shell exits.
setopt share_history            # Constatly load history from other sessions.

setopt hist_ignore_dups         # Don't store a line if it's the same as the previous one.
# setopt hist_ignore_all_dups
setopt hist_expire_dups_first
# setopt hist_save_no_dups
# setopt hist_find_no_dups
