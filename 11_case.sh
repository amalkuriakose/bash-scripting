#!/bin/bash

finished=0

while [ $finished -ne 1 ]
do
    echo "What is your favorite linux distro?"

    echo "1 - Arch"
    echo "2 - CentOS"
    echo "3 - Debian"
    echo "4 - Ubuntu"
    echo "5 - Mint"
    echo "6 - Something else..."
    echo "7 - Exit the script"

    read distro;

    case $distro in
        1) echo "Arch is a rolling release";;
        2) echo "CentOS is popular on servers";;
        3) echo "Debian is a community distribution";;
        4) echo "Ubuntu is popular on both servers and computers";;
        5) echo "Mint is popular on laptops and desktops";;
        6) echo "There are many other distributions too";;
        7) finished=1 ;;
        *) echo "Please enter a number between 1 and 7";;
    esac

done

echo "Thank you for using this script"
