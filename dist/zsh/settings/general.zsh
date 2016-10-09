#
# General settings
#

# Improve the on-line help provided by the shell.
# Use <Esc-h> to invoke `run-info` for the command in the current input.
# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Accessing-On_002dLine-Help
unalias  run-help  # run-help is normally aliased to `man`
autoload -Uz run-help

# Color theme.
# Change the default ANSI colors on interactive ($PS1) shells with 256 colors.
base16_repo="https://github.com/chriskempson/base16-shell"
base16_folder="$HOME/.config/base16-shell"
[[ -d $base16_folder ]] || git clone $base16_repo $base16_folder
[[ -n $PS1 ]] && source "$base16_folder/scripts/base16-tomorrow-night.sh"

# Automatically search the official repositories when entering an unrecognized
# command and look for a package that owns a file matching the command.
#
# Depends on `pkgfile` and uses its "command not found" hook.
# Requires the `pkgfile` database to be synced, use `pkgfile -u`.
# https://wiki.archlinux.org/index.php/Pkgfile#Command_not_found
if [[ -e '/usr/share/doc/pkgfile/command-not-found.zsh' ]]; then
  source '/usr/share/doc/pkgfile/command-not-found.zsh'
fi

# Rbenv
if [[ -d "${HOME}/.rbenv" ]]; then
  export PATH="${HOME}/.rbenv/bin:${PATH}"
  eval "$(rbenv init -)"
fi
