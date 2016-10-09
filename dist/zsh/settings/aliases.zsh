#
# Aliases
#
# See `man zshmisc`, section ALIASING.

# Common
# ======

# grep
alias grep='grep --color'

# man (colorized man pages)
man() {
	env \
    LESS_TERMCAP_mb=$(printf "\e[01;31m")       \
    LESS_TERMCAP_md=$(printf "\e[01;38;5;74m")  \
    LESS_TERMCAP_me=$(printf "\e[0m")           \
    LESS_TERMCAP_se=$(printf "\e[0m")           \
    LESS_TERMCAP_so=$(printf "\e[38;5;246m")    \
    LESS_TERMCAP_ue=$(printf "\e[0m")           \
    LESS_TERMCAP_us=$(printf "\e[04;38;5;146m") \
		PAGER="${commands[less]:-$PAGER}"           \
			man "$@"
}

# List
alias ls='ls -lh --color=auto'  # Long list, human readable with colors
alias la='ls -lA'               # `ls` plus show hidden files (except . and ..)
alias lx='ls -x'                # List entries by lines instead of by columns

# History
alias history='fc -l 1'         # Display full list, not only last few itmes.
alias hg='history | grep'       # Grep history

# Copy with progress (using rsync)
#
# `rsync` options:
# Preserve permissions (-p), owner (-o) and group (-g), human readable (-h),
# backup files before overwriting (-b) to '/tmp/rsync' (--backup-dir),
# display progress (--progress), only for local files (-e, no remote shell).
#
alias cpp='rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress'



# Utilities
# =========

# Open the 'dotfiles' folder with the default editor.
alias dotfiles="${EDITOR} ${HOME}/dotfiles"

# Shortcuts to `cd` into folders with autocompletion.
# Custom function: foldershortcut [alias] [folder]
autoload -Uz 'foldershortcut'
foldershortcut c  ~/code
foldershortcut cr ~/code/ruby
foldershortcut cj ~/code/js
foldershortcut ce ~/code/elixir



# Apps
# ====

# Bundler
if (( ${+commands[bundler]} )); then
  # Install gems using parallel workers (workers = available processing units).
  alias bi="bundle install --jobs=$(nproc)"
  alias be='bundle exec'
  alias bl='bundle list'
  alias bo='bundle open'
  alias bu='bundle update'
fi

# Rails
if (( ${+commands[rails]} )); then
  # Environment aliases
  # (-g means global alias, will be expanded even if not in command position)
  alias -g RD='RAILS_ENV=development'
  alias -g RP='RAILS_ENV=production'
  alias -g RT='RAILS_ENV=test'

  # Command aliases
  alias rc='rails console'
  alias rd='rails destroy'
  alias rdb='rails dbconsole --include-password'
  alias rg='rails generate'
  alias rgm='rails generate migration'
  alias rs='rails server'
fi
