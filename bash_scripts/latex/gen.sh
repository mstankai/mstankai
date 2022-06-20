#!/bin/bash

# script runing pdflatex to generate my thesis
# use VER or VERSION to change backup version value from 0
# use CH or CHAPTER to run a single chapter

# -----------------------------------
# ARGUMENTS

for ARGUMENT in "$@"
do
    KEY=$(echo $ARGUMENT | cut -f1 -d=)
    VALUE=$(echo $ARGUMENT | cut -f2 -d=)   
    case "$KEY" in
        VER)                VERSION=${VALUE} ;;
        VERSION)            VERSION=${VALUE} ;;
        CH)                 CHAPTER=${VALUE} ;;     
        CHAPTER)            CHAPTER=${VALUE} ;;     
        *)   
    esac    
done

# -----------------------------------
# CONFIG

INPUT="thesis"
OUTPUT="output"
DATE=`date "+%Y-%m-%d"`
OUTNAME=$INPUT 

# -----------------------------------
# CREATE PDFLATEX COMMANDS

# base command
cmd='pdflatex --shell-escape --output-dir=$OUTPUT -file-line-error "$INPUT" | grep ".*:[0-9]*:.*"' 
base='pdflatex'

# thesis or chapter mode?
if [ -z "${CHAPTER}" ]
then
    echo "Compiling entire thesis ... "
else
    echo "Compiling chapter $CHAPTER "
    s_ch='"\includeonly{chapters/$CHAPTER/$CHAPTER,chapters/appendix/appendix,bibliography}\input{$INPUT}"'
    s_in='"$INPUT"' 
    cmd="${cmd%%${s_in}*}${s_ch}${cmd##*${s_in}}" 
    OUTNAME="ch_${CHAPTER}" 
fi

# create quiet and loud commands
sq=' -interaction=batchmode' 
sl=' -interaction=nonstopmode' 

cmd_q="${cmd%%${base}*}${base}${sq}${cmd##*${base}}" 
cmd_l="${cmd%%${base}*}${base}${sl}${cmd##*${base}}" 

echo $cmd_q

# -----------------------------------

#determine aux name by stripping .tex suffix and adding .aux
AUXNAME="${INPUT%.tex}.aux"


# -----------------------------------
# RUN
# -----------------------------------
echo 000000000000000000000000000000000000000000000000000
echo
echo Running PDFLATEX I ....

eval $cmd_q

echo 
echo 000000000000000000000000000000000000000000000000000
echo
echo BIBTEX:
echo

echo "RUNNING: cp references.bib $OUTPUT/"
cp references.bib thesis.bst $OUTPUT/
echo "RUNNING: cd $OUTPUT"
cd $OUTPUT
echo "RUNNING: bibtex thesis"  
#echo $cmd
bibtex thesis
echo "RUNNING: cd .."
cd ..

echo
echo END of BIBTEX
echo
echo 000000000000000000000000000000000000000000000000000
echo
echo Running PDFLATEX II ....

eval $cmd_q

echo 
echo 000000000000000000000000000000000000000000000000000
echo
echo Running PDFLATEX III ....
echo
echo OUTPUT:
echo 

eval $cmd_l

echo
echo END of PDFLATEX III
echo
#echo 000000000000000000000000000000000000000000000000000
#echo
#echo TEXCOUNT:
#echo 
#echo
#
#texcount -merge  thesis.tex
#
#echo
echo 000000000000000000000000000000000000000000000000000
echo 
echo "Version produced at: "$DATE
echo

# versioning
if [ -z "${VERSION}" ]
then
    cp output/${INPUT}.pdf versions/${OUTNAME}_${DATE}.pdf
    echo "$OUTNAME --> Daily version -- 0 -- "
else
    cp output/${INPUT}.pdf versions/${OUTNAME}_${DATE}_${VERSION}.pdf
    echo "$OUTNAME --> Daily version -- ${VERSION} -- "
fi

# moving current version to base folder
mv output/${INPUT}.pdf pdfs/${OUTNAME}_MigleStankaityte.pdf
echo
echo Output in :  pdfs/${OUTNAME}_MigleStankaityte.pdf

echo
echo 000000000000000000000000000000000000000000000000000
