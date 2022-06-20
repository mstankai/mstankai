#!/bin/bash

# =====================
# created following
# https://linuxconfig.org/bash-scripting-tutorial
# =====================

# testing if a file exists

echo -e "\nGive me a file name: \c"
read file

if [ -e $file ]
then 
    echo -e "\nFile \"$file\" exists!"
else
    echo -e "\nFile \"$file\" does not exist!"
fi




