#!/usr/bin/env bash


##########################################
####  FIND FILES AND DIRECTORIES #########
##########################################

find .                              # find all files in current firectory

find . -name 'id_rsa*'              # find all files in current directory with name pattern

find . -iname "MISHA the TZAR.TXT"  # case insensitive

find . \( -iname "*TZAR.txt" -o -name "*king.txt" \)    # search for multiple name patterns

find . -type f -name '*.rb'         # find files in current dir with extension .rb

find . -type d -name '.*'           # look for hidden directories

find /tmp -perm 777                 # find all files in /tmp dir with 777 permission

find /tmp -mtime +2                 # find files modified time greater than 2 days. (current_time - file_time) / (86400*2) (seconds in day)

find . -name "*.txt"  -mtime -1     # find files modified in last day

find . -size 0c                     # find files of 0 bytes in current dir

find . -size +100M                  # find files greater than 100MB in current dir.

find /tmp -type d                   # find all the directories in /tmp

find /tmp -type d -not -name ".*"                   # find all the directories in /tmp, except hidden ones

find /tmp -mindepth 1 -type d  -not -name ".*"      # find all dirs except of /tmp dir and hidden ones

find /opt /usr /var -name "*.log" -type f           # search for .log files in multiple directories


##########################################
####  FIND AND MODIFY FILES ##############
##########################################

find /tmp -perm 777 -exec ls {} \;                        # best practise is to do $(ls), before you want to exec command on files
find /tmp -perm 777 -exec chmod 555 {} \;                 # change permission to 555 for every file with 777 in /tmp dir

find . -mindepth 1 -type f  -exec ls {} \; 
find . -mindepth 1 -type f  -exec rm {} \;                # remove all the files in current dir except  "." dir



#Not a best practise from the speed  term
find . -mindepth 1 -type d -not -name ".*" | xargs ls
find . -mindepth 1 -type d -not -name ".*" | xargs rm -d  # remove all directories in /tmp, except hidden dirs

find /tmp -type f -name "*.log" | xargs tar -cvf /tmp/`date '+%d%m%Y'_archive.tar.gz` --absolute-names


##########################################
####  USEFUL URLS ########################
##########################################

# https://alvinalexander.com/unix/edu/examples/find.shtml
# https://linux.101hacks.com/linux-commands/find-command-examples/
# https://www.cyberciti.biz/faq/linux-unix-bsd-xargs-construct-argument-lists-utility/