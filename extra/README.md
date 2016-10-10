Extra
=====

Extra files and scripts to further configure the system beyond dotfiles.


## Files

### 70-custom-keyboard-mappings.hwdb

Copy `70-custom-keyboard-mappings.hwdb` into `/etc/udev/hwdb.d` to map
the `Caps Lock` key to the `Escape` key. It works even under Wayland.

### iconsolata_for_powerline.otf

Patched font with icons for Vim's statusline.


## Scripts

### install_tmux_from_src.sh

Run `install_tmux_from_src.sh` to install *tmux* 2.2 from source when not
available from a package repository.

### install_vim_statusline_font.sh

Installs the patched font with icons for Vim's statusline.
