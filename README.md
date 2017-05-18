Dotfiles
========


## Dependencies

- Arch Linux

  ```sh
  # CLI vim that comes with gvim has clipboard support
  pacman -S curl git zsh tmux gvim ctags the_silver_searcher pkgfile
  ```

- Debian

  ```sh
  apt-get install curl git zsh tmux vim exuberant-ctags silversearcher-ag
  ```

- CentOS

  ```sh
  # Install tmux 2.x from source, see the notes below
  yum install curl git zsh vim-enhanced ctags
  ```


## Install dotfiles

```sh
git clone https://github.com/matiasgagliano/dotfiles ~/dotfiles
sh ~/dofiles/init.sh

```


## Set up

- Change login shell to Zsh:

  `chsh -s $(which zsh)`

- Install *tmux* 2.x from source if not available from package repositories:

  ```sh
  # Installs tmux globally as root or locally for non-root users
  sh ~/dofiles/extra/scripts/install_tmux_from_src.sh
  ```

- Install patched icon font for Vim's statusline:

  Copy `~/dotfiles/extra/files/iconsolata_for_powerline.otf`
  to the fonts folder and run `fc-cache -v -f`, or run
  `sh ~/dofiles/extra/scripts/install_vim_statusline_font`.

- Map `Caps Lock` to `Esc` key:

  Copy `~/dotfiles/extra/files/70-custom-keyboard-mappings.hwdb`
  into `/etc/udev/hwdb.d`.

- When using `pkgfile`, enable its `systemd` timer to automatically
  synchronize the files database:

  ```sh
  systemctl enable --now pkgfile-update.timer
  ```


## License

Copyright 2016, Matías A. Gagliano.
Dual licensed under the MIT or GPLv3 licenses.

* <http://opensource.org/licenses/MIT>
* <http://opensource.org/licenses/GPL-3.0>


## Contributing

This repository was possible by [standing in the sholders of giants][1] and is
hereby released to allow others to base their work on it. Beyond that keep in
mind that this are my personal *dotfiles*, bug reports and some enhancements
might be appreciated but no feature requests.

[1]: https://en.wikipedia.org/wiki/Standing_on_the_shoulders_of_giants
