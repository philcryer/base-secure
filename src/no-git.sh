#!/usr/bin/env bash

set -e

distro=$(uname)

function msg_status () {
    echo -e "\x1B[01;34m[*]\x1B[0m $1"
}
function msg_good () {
    echo -e "\x1B[01;32m[*]\x1B[0m $1"
}
function msg_error () {
    echo -e "\x1B[01;31m[*]\x1B[0m $1"
}
function msg_notification () {
    echo -e "\x1B[01;33m[*]\x1B[0m $1"
}

msg_status "let's (auto) basejump!"

os-check(){
    msg_notification "checking operating system"
        if [ "$distro" == "Linux" ]; then
            msg_good "$distro is supported, continuing"
        elif [ "$distro" == "MacOS" ]; then
            msg_good "$distro is supported, continuing"
        fi
}

install-xcode(){
    if ! command -v cc >/dev/null; then
        msg_notification "xcode commandline tools not installed, installing"
        xcode-select --install
    fi
    msg_good "xcode commandline tools installed"
}

software-check(){
  msg_notification "checking for required software"
    for cli in curl python pip git sudo; do
      if ! type "$cli" > /dev/null 2>&1; then
        msg_error "$cli is not installed - install that and try again"; exit 1
      fi
  	done
  msg_good "all required software installed"
}

get-basejump(){
  msg_notification "checking out basejump-master"
    if [ ! -d '$HOME/devel' ]; then
        msg_notification "creating checkout directory"
        mkdir -p $HOME/devel
    fi
    if [ -d '$HOME/devel/basejump-master' ]; then
        rm -rf $HOME/devel/basejump-master
        cd $HOME/devel; curl -sL https://github.com/philcryer/basejump/archive/master.tar.gz | tar xz
    else
        cd $HOME/devel; curl -sL https://github.com/philcryer/basejump/archive/master.tar.gz | tar xz
    fi
    msg_good "basejump-master downloaded"
}

main(){
    os-check;
    if [ "$distro" == "MacOS" ]; then
      install-xcode;
    fi
    software-check;
    get-basejump;
    msg_status ">> Next steps >>"
    msg_status "* run"
    msg_status "  cd $HOME/devel/basejump-master"
    msg_status "* edit gitconfig vars in ansible/group_vars/all.yml"
    msg_status "* run basejump!"
    msg_status "  ./basejump"
}

main;

exit 0
