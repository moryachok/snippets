#!/usr/bin/env bash

##########################################
####  FIND FILES AND DIRECTORIES #########
##########################################

find .                        # find all files in current firectory

find . -name 'id_rsa*'        # find all files in current directory with name pattern

find . -type f -name '*.rb'   # find files in current dir with extension .rb

find . -type d -name '.*'     # look for hidden directories

find /home -perm 777          # fin all files in /home dir with 777 permission

find /home -mtime +1          # find files modified in last day

find /home -atime +1          # find files accessed in last day

find . -size 0c               # find files of 0 bytes in current dir

##########################################
####  FIND AND MODIFY FILES ##############
##########################################

find /home -perm 777 -exec chmod 555 {} \; # change permission to 555 for every file with 777 in /home dir
find . ! -path . -exec rm -r {} \; # remove evetything in current dir except  "." dir

