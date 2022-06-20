#!/bin/bash

# =====================
# created following
# https://linuxconfig.org/bash-scripting-tutorial
# =====================

# >> learning the `trap` command

# define the trap command
trap bashtrap SIGINT
# this will execute `bashtrap` on recieving
# the SIGINT signal, i.e. CTRL+C

# define trap routine
bashtrap(){
    echo -e "stop that! .. ignoring."
}

# run countdown loop
count=10

for i in $(seq $count -1 0) 
do
    echo "${i}s until exit.."
    sleep 1
done

echo "Goodbye!"

