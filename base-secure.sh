#!/usr/bin/env bash

#=============================================================================
# basejump --- a script that uses Ansible to automate the setup of new hosts
#       with applications, dotfiles, configs, and handly-dandy one-liners on
#       Linux and macOS systems.
# Copyright: (c) 2019 philcryer
# Author: philcryer < phil at philcryer dot com >
# URL:  https://github.com/philcryer/basejump
# License: MIT
#=============================================================================

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

kick-off(){
    clear
    echo -e "\x1B[01;31m"
    echo "    |         |     |                     |    |             |               |"
    echo "  |        |       |    |       |                 |        |             |"
    cat src/logo-ascii.txt
    msg_status "base secure?"
    sudo -v
}

os-check(){
    msg_notification "checking operating system"
        if [ "$distro" == "Linux" ]; then
            msg_good "$distro is supported, continuing"
        fi
}

software-check(){
    msg_notification "checking for required software"
    for cli in python curl git sudo; do
        if ! type "$cli" > /dev/null 2>&1; then
            msg_error "$cli is not installed - install that and try again"; exit 1
        fi
    done
    msg_good "all required software installed"
}

software-check-pip(){
    msg_notification "checking for python pip3"
    for cli in pip3; do
        if ! type "$cli" > /dev/null 2>&1; then
            msg_error "$cli is not installed - attempting to install"
            curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
            #sudo python get-pip.py
            python get-pip.py
            rm get-pip.py
        else
            msg_notification "checking for latest version of python pip3"
            #sudo -H pip3 install --upgrade pip
            pip3 install --upgrade pip
        fi
  	done
    msg_good "python pip is installed"
}

install-ansible(){
    if ! type "ansible" > /dev/null 2>&1; then
        msg_notification "ansible not installed, enter sudo password to install"
        sudo -H pip3 install ansible
    fi
    msg_good "ansible is installed"
}

run-ansible(){
    msg_status "handing off to ansible!"
    cd ansible
    ansible-galaxy collection install devsec.hardening 
    ansible-galaxy role install thorian93.upgrade
    ansible-playbook -i inventory -c netconf --become-method sudo --become-user root main.yml
    ansible-playbook -i inventory -c netconf --become-method sudo --become-user root update.yml
}

main(){
    kick-off;
    os-check;
    software-check;
    software-check-pip;
    install-ansible;
    run-ansible;
}

main;

exit 0