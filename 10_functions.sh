#!/bin/bash

release_file=/etc/os-release
logfile=results.log
errorlog=errors.log

check_exit_status() {
    if [ $? -ne 0 ]
    then
        echo "An error occured, please check thee $errorlog file"
    fi 
}

if grep -q "Arch Linux" $release_file
then
    # If the host is based on Arch, then run the packman update command
    sudo pacman -Syu 1>>$logfile 2>>$errorlog
    check_exit_status
fi

if grep -q "Ubuntu" $release_file || grep -q "Debian" $release_file
then
    # If the host is based on Debian or Ubuntu, then run the apt update command
    sudo apt update 1>>$logfile 2>>$errorlog
    check_exit_status
    
    sudo apt dist-upgrade -y 1>>$logfile 2>>$errorlog
    check_exit_status
fi
