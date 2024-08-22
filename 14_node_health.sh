#!/bin/bash

# Author - Amal
# This script outputs the node health

set -x # debug mode
set -e # exit when there is an error
set -o pipefail # catch pipe fail

df -h

free -g

nproc

ps -ef | grep bash | awk -F " " '{print $2}'
