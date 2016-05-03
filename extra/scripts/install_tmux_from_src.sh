#!/bin/bash
#
# Install tmux, globally (root) or locally (non root user)
#
set -e

TMUX_VERSION=2.2
LIBEVENT_VERSION=2.0.22
NCURSES_VERSION=6.0


if [[ "$EUID" == "0" ]]; then
  echo "Running as root, tmux will be installed globally."
else
  echo "Not running as root, tmux will be installed for the current user only."
  echo "Make sure that build essentials are installed."
fi

while true; do
  read -n 1 -p "Do you want to continue? (y/n)" answer

  case $answer in
    [Yy] ) break;;
    [Nn] ) exit;;
    * ) echo 'Please answer "y" (yes) or "n" (no).';;
  esac
done



# ____________________
#
#        System
# ____________________
#

# Build dependencies
# ==================

# Make sure that build dependencies are present when running as root
if [[ "$EUID" == "0" ]]; then
  if $(command -v yum >/dev/null 2>&1); then
    yum -y install coreutils curl tar gcc gcc-c++ make kernel-devel
  elif $(command -v apt-get >/dev/null 2>&1); then
    apt-get -y install coreutils curl tar gcc g++ make linux-headers-$(uname -r)
  fi
fi


# Folders
# =======

# Install globally if running as root or in "~/local" otherwise
if [[ "$EUID" == "0" ]]; then
  destination="/usr/local"
else
  destination="$HOME/local"
fi
mkdir -p $destination

# Sandbox
sandbox="$HOME/src"
if [[ -d $sandbox ]]; then had_sandbox=true; else had_sandbox=false; fi
mkdir -p $sandbox



# ____________________
#
#       Install
# ____________________
#

# Log
# ===

logfile="$sandbox/build.log"

if [[ -e $logfile ]]; then
  i=0

  while true; do  # emulate do-while
    let i+=1
    nextlog="${sandbox}/build_${i}.log"
    [[ -e $nextlog ]] || break
  done

  mv $logfile $nextlog
fi


# Get source
# ==========

cd $sandbox
[[ -f 'libevent.tar.gz' ]] || curl -L -o libevent.tar.gz https://github.com/libevent/libevent/releases/download/release-${LIBEVENT_VERSION}-stable/libevent-${LIBEVENT_VERSION}-stable.tar.gz
[[ -f 'ncurses.tar.gz' ]]  || curl -L -o ncurses.tar.gz  ftp://ftp.gnu.org/gnu/ncurses/ncurses-${NCURSES_VERSION}.tar.gz
[[ -f 'tmux.tar.gz' ]]     || curl -L -o tmux.tar.gz     https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz


# libevent
# =========

cd $sandbox
tar -xzf libevent.tar.gz && cd libevent-${LIBEVENT_VERSION}-stable
echo -e "\n\n\nlibevent\n" >> $logfile
./configure --prefix=$destination 2>&1 | tee -a $logfile
make 2>&1 | tee -a $logfile
make install 2>&1 | tee -a $logfile


# ncurses
# =======

cd $sandbox
tar -xzf ncurses.tar.gz && cd ncurses-${NCURSES_VERSION}
echo -e "\n\n\nncurses\n" >> $logfile
./configure --prefix=$destination 2>&1 | tee -a $logfile
make 2>&1 | tee -a $logfile
make install 2>&1 | tee -a $logfile


# tmux
# ====

cf="-I${destination}/include -I${destination}/include/ncurses"
ldf="-Wl,-rpath=${destination}/lib,-L${destination}/lib -L${destination}/include -L${destination}/include/ncurses"

cd $sandbox
tar -xzf tmux.tar.gz && cd tmux-${TMUX_VERSION}
echo -e "\n\n\ntmux\n" >> $logfile
CFLAGS=$cf LDFLAGS=$ldf ./configure --prefix=$destination 2>&1 | tee -a $logfile
make 2>&1 | tee -a $logfile
make install 2>&1 | tee -a $logfile



# ____________________
#
#       Clean up
# ____________________
#

[[ $had_sandbox == true ]] || rm -rf $sandbox
