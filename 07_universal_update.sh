#!/bin/bash

release_file=/etc/os-release

if grep -q "Arch Linux" $release_file
then
    # If the host is based on Arch, then run the packman update command
    sudo pacman -Syu
fi

if grep -q "Ubuntu" $release_file || grep -q "Debian" $release_file
then
    # If the host is based on Debian or Ubuntu, then run the apt update command
    sudo apt update
    sudo apt dist-upgrade -y
fi
