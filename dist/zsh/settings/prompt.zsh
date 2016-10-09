#
# Prompt
#
# Explained ZSH Prompt
# http://aperiodic.net/phil/prompt

# Perform parameter expansion, command substitution and arithmetic expansion in
# prompt strings.
setopt prompt_subst

# The colors module provides the colors function, which creates the associative
# arrays $fg and $bg containing the terminal-appropriate ANSI escape codes for
# setting the forground and background colors respectively.
autoload -Uz colors && colors

# Update the prompt every time the mode changes (vi insert or command).
# http://dougblack.io/words/zsh-vi-mode.html
#
# This ZLE hook resets the prompt (`zle reset-prompt`) each time the
# keymap changes (`zle-keymap-select`) so that mode info is updated.
zle-keymap-select() { zle reset-prompt }
zle -N zle-keymap-select

# Redraw prompts when the terminal size changes.
#
# http://zsh.sourceforge.net/Doc/Release/Functions.html#Special-Functions (9.3.2)
# https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/vi-mode/vi-mode.plugin.zsh
# `man zshzle`
#
TRAPWINCH() {         # Trap window resize.
  zle && {            # Make sure `zle` is active.
    zle reset-prompt  # Re-expand left and right prompts, then redisplay the edit buffer.
    zle -R            # Redisplay the command line (allow any changes to become visible).
  }
}

# Set prompt theme
# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Prompt-Themes
fpath=("${ZSH}/prompts" $fpath)
autoload -Uz promptinit && promptinit
prompt jarvis
