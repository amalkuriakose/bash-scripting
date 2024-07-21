#!/bin/bash

#echo "You entered the arguments: $1, $2 and $3"

lines=$(ls -lh $1 | wc -l)

if [ $# -ne 1 ]
then
    echo "This script requires exactly one directory path passed to it"
    echo "Please try again"
    exit 1
fi

echo "Number of objects in $1 directory is $(($lines-1))"
