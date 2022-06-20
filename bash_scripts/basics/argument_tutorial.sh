#!/bin/bash

# =====================
# created following
# https://linuxconfig.org/bash-scripting-tutorial
# =====================

# passing arguments to the shell 
# require three arguments

echo -e "number of arguments passed: $#\n"

echo "printing arguments one by one"
echo $1 $2 $3
echo


echo "printing all arguments at once"
echo $@
echo

echo "moving arguments into an array and printing"
args=("$@")
echo ${args[0]}  ${args[1]}  ${args[2]}
echo


echo "printing arguments in a loop"
cmd=""
for ARG in "$@"
do
    cmd+="$ARG "
done
echo $cmd


