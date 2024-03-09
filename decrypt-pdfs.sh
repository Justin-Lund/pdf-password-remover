#!/bin/bash
# Unprotect multiple pdf files in a directory with qpdf
# May not work if filenames contain spaces
# Run the script from the same directory as the files
# Install qpdf if not already installed, with apt-get install qpdf

: ${1?"Usage: $0 'passwordGoesHere'"}

if [ -d output ];
then
    echo "output directory exists"
else
    mkdir output
fi


filenames=`ls *.pdf`
#echo filenames
for eachFile in $filenames
do
   echo $eachFile
    qpdf --password=$1 --decrypt $eachFile output/$eachFile
done
