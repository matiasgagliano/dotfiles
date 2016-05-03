#!/bin/bash
set -e

dist="$(cd "$(dirname "$0")" && pwd)/dist"
[[ ! -d $dist ]] && exit 1

for src in $dist/*; do
  target="$HOME/.$(basename $src)"
  backupdir="$HOME/dotfiles_backup"
  echo "$src -> $target"

  # Backup the files that already exist
  if [[ -a $target ]]; then
    mkdir -p $backupdir
    mv $target $backupdir
  fi

  # Remove existing links and create new ones
  [[ -h $target ]] && rm $target
  ln -s $src $target
done
