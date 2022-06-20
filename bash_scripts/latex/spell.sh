#!/bin/bash

# ===================

# run latex-type aspell on .tex files in a folder
# INPUT - folder path

# ===================

FILES=$(ls -b ${1}/*.tex) 

for f in ${FILES}
do
    cmd="aspell -t -c ${f}"
    echo "---------------------------------"
    echo $cmd
    eval $cmd 
done

