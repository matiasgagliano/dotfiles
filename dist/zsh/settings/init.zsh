#
# ZSH init
#

# Add functions path
fpath=("${ZSH}/functions" $fpath)

# Delete all existing keymaps and reset to the default state (default key bindings).
bindkey -d

# Prevent <Ctrl-s> from freezing the terminal (used to save in Vim)
stty stop undef
setopt no_flowcontrol

# Check if in a TTY unless sshing (export before running tmux).
[[ -n "$SSH_CLIENT" ]] && [[ "$TTY" = /dev/tty* ]] && export IN_A_TTY=1

# Autostart tmux (only once) if present, autoclose the terminal when tmux exits.
# Don't start tmux if already in a screen terminal (`ssh` or `su` from tmux).
[[ ! $TERM =~ 'screen' ]] && [[ -z "$TMUX" ]] && (( ${+commands[tmux]} )) && tmux && exit

# Enable colors when supported and outside tmux (tmux sets its own terminal).
[[ -z "$TMUX" ]] && [[ `tput colors` == '256' ]] && TERM='xterm-256color'
