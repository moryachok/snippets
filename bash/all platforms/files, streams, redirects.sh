#!/usr/bin/env bash

# checking file existance with Variable in filepath
FILETOCHECK="$HOME/.profile"
[[ -f $(bash -c "echo  $FILETOCHECK")  ]] && echo "File Exist" || echo "File does not exist"

cat * | wc -l   # prints amount of lines in all files in current directory

diff file1 file2 # prints difference between two files

############################################
#### STDIN, STDOUT, STDERR & REDIRECTS #####
############################################

echo "this is redirect example" > newfile # create a file, or overwrite contents of it with echo msg

echo "this is append example " >> newfile # will append contents


throwErrorExample 2>testfile #STDERR redirected to testfile
throwErrorExample 2>>testfile #STDERR appended to testfile

throwErrorExample 2> /dev/null # STDERR muted

# STDOUT to mystdoutput , stderr to mystderror in single command
cat file1 file2 fileNotExist > mystdoutput 2> mystderror

# STDIN & STDERR to single file: mystdoutput
cat file1 file2 filenotexist >mystdoutput 2>&1

