#!/bin/bash

# =====================
# created following
# https://linuxconfig.org/bash-scripting-tutorial
# =====================


# Defining a global variable
VAR="global variable"

# Defining a local variable
# i.e. a variable inside a function

new_function () {
    # defining a local variable
    local VAR="local variable"
    echo $VAR
}

# ---------------
# main

# print variable
echo $VAR

# run function
new_function

# print variable
echo $VAR




