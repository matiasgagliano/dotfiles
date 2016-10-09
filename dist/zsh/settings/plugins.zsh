#
# Plugins
#


# Loader (zgen)
# ======

# Fix: Backup $ZSH, Zgen overwrites it
_ZSH=$ZSH

# Fix: Prevent Zgen from calling `compinit` before the completion settings.
ZGEN_AUTOLOAD_COMPINIT=0

# Set zgen dir, used by zgen itself
ZGEN_DIR="${ZSH}/zgen"

# Install `zgen` if not already installed
if [[ ! -d $ZGEN_DIR ]]; then
  git clone --depth 1 https://github.com/tarjoilija/zgen $ZGEN_DIR
fi

# Load zgen
source $ZGEN_DIR/zgen.zsh

# Build zgen's init script if it doesn't exist
if ! zgen saved; then
  zgen load 'zsh-users/zsh-history-substring-search'
  zgen load 'zsh-users/zsh-autosuggestions'
  zgen load 'zsh-users/zsh-completions'

  # Save all to init script
  zgen save
fi

# Restore $ZSH
ZSH=$_ZSH
unset _ZSH
