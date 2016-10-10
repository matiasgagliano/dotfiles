#!/bin/bash
#
# Install icon font for Vim's statusline
#
set -e

if [[ "$EUID" == "0" ]]; then
  font_dir="/usr/share/fonts/"
  echo "Running as root, the icon font will be installed globally in $font_dir."
else
  font_dir="$HOME/.local/share/fonts"
  echo "Not running as root, the icon font will be installed for current user only in $font_dir."
fi

while true; do
  read -n 1 -p "Do you want to continue? (y/n)" answer

  case $answer in
    [Yy] ) break;;
    [Nn] ) exit;;
    * ) echo 'Please answer "y" (yes) or "n" (no).';;
  esac
done


# Dependencies
# ============

# Try to install the font configuration library if not present
if ! $(command -v fc-cache >/dev/null 2>&1); then
  if [[ "$EUID" == "0" ]]; then
    if $(command -v pacman >/dev/null 2>&1); then
      pacman --noconfirm -S fontconfig
    elif $(command -v apt-get >/dev/null 2>&1); then
      apt-get -y install fontconfig
    elif $(command -v yum >/dev/null 2>&1); then
      yum -y install fontconfig
    fi
  else
    echo "The \"fontconfig\" library couldn't be installed."
    echo "Install it and run \"fc-cache -v -f $font_dir\" to update fonts."
  fi
fi


# Install font
# ============

mkdir -p $font_dir
src_dir="$(cd "$(dirname "$0")" && pwd)/../files"

echo "Copying font..."
cp "$src_dir/iconsolata_for_powerline.otf" $font_dir

if command -v fc-cache >/dev/null 2>&1; then
  echo "Resetting font cache, this may take a moment..."
  fc-cache -v -f $font_dir
fi
