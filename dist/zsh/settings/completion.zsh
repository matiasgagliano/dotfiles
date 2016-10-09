#
# Completion
#
# http://zsh.sourceforge.net/Doc/Release/Completion-System.html

# Activate the completion caching layer for any completions which use it (pacman, etc.)
zstyle ':completion::complete:*' use-cache 1

# Path where cache files containing dumped completion data are stored
zstyle ':completion::complete:*' cache-path $ZSH_TMP

# One completion is always inserted completely, then when you hit TAB it
# changes to the next and so on until you get back to where you started.
setopt menu_complete

# Completion colors
zmodload -i 'zsh/complist'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select

# Try simple completion first and fallback to case insensitive,
# partial-word and substring completion.
#
# Having `~/code/extra/samples`, it allows `cd ~/c/e/s<TAB>`
# to be completed to `cd ~/code/extra/samples`.
#
# See "matcher-list" section in `man zshcompsys` and
# "COMPLETION MATCHING CONTROL" section in `man zshcompwid`.
#
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# Completions for `kill` command
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# Complete in the middle of words (just what's before the cursor)
setopt complete_in_word
setopt always_to_end

# Initialize complition, move `.zcompdump` to the `tmp` folder.
#
# This will define utility functions, arrange for the necessary
# shell functions to be autoloaded and will then re-define all
# widgets that do completion to use the new system.
#
# Make sure that completion modules are loaded before the call
# to `compinit` so that widgets are also re-defined.
autoload -Uz compinit
compinit -d "${ZSH_TMP}/.zcompdump"

# Allow SSH tab completion for Mosh (Mobile Shell) hostnames
compdef mosh=ssh
