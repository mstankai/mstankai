#!/bin/bash

# declare a string
STRING="\nHello World!\n"

# print to screen
echo -e $STRING

# -------------
FILE_NAME=textfile_$(date +%a-%d-%b-%Y).txt

echo -e "I will create a new file today, called ${FILE_NAME}\n"

# define command
cmd="echo 'hi!' > ${FILE_NAME}"

# run command and print to screen
echo "running >> $cmd"
eval $cmd

