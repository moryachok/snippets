#!/usr/bin/env bash


##########################################
###  SYMBOLIC AND NUMERIC PERMISSIONS ####
##########################################

# has three types of permissions
r = 4 # read access, view directory contents, but not the file attributes
w = 2 # write, add and delete files, including files that you do not own, if you have dir write privilidges
x = 1 # execute, cd into a directory and execute files in it


# symbolic to numeric
-r- = 4     = 4  # read only permission
-rw = 4+2   = 6  # read and write permission
rwx = 4+2+1 = 7  # read, write and execute

# each permission divided to 3 sets of 3 permissions
- | rw- | rw- | r--


-   # regular file
rw- # mishauser has read and write permissions
rw- # mishagroup has read and write permissions
r-- # anyone has read permission

-rw-rw-r-- 1 mishauser mishagroup 0 Jan  6 15:35 file.txt

# first symbol in symbolic permission
-  # regular file
x  # executable
l  # symlink
b  # block devices (disk)
c  # character devices
d  # regular directory

##########################################
######  CHOWN COMMANDS ###################
##########################################

chown ubuntu:ubuntu ./folder
chown -R ubuntu:ubuntu ./folder


##########################################
#############  COMMANDS ##################
##########################################

# 764 = -rwxrw-r-- numeric permission explained
7   # rwx for user that owns file/directory
6   # rw for group
4   # readonly for other users
chmod 764 file.txt


# adding execute permission to file
# u  - changing permissions to current user
# +x - adding execute permission on a file
chmod u+x file.txt 
-rw-r--r-- 1 misha misha    4 Jan  6 15:46 file.txt # before the change
-rwxr--r-- 1 misha misha    4 Jan  6 15:46 file.txt # after the change

# remove execute permission
chmod u-x file.txt  
-rw-r--r-- 1 misha misha    4 Jan  6 15:46 file.txt # before the change


# add execute permission for the current group
chmod g+x file.txt  
-rwxr-xr-- 1 misha misha    4 Jan  6 15:46 file.txt # after the change


# adding group write permissions to myDirectory
# files inside myDirectory will not be affected
chmod g+w myDirectory

# -R : change permission recurcively for all files inside myDirectory
chmod g+w myDirectory -R

# -c : reports on files that were changed
chmod 744 myDirectory -R -c

# -v : show files that were changed
chmod 744 myDirectory -R -v


##########################################
##### UMASK and DEFAULT PERMISSIONS ######
##########################################

# will substract umask values from default system permission on file/dir creation
umask # prints 0002
0 - always zero | 0 - user | 0 - group | 2 - anyone

# default 666 for a file
# umask 0002
# 666 - 002 = 664
touch file.txt # permission 664

# default 777 for a directory
# umask 0002
# 777 - 002 = 775
mkdir myDir # permission 775

# set different defaults
umask 004

# set umask for user by:
# umask xxx ~/.profile

##########################################
##### SPECIAL PERMISSIONS ################
##########################################


# the first digit in the numeric permission 
4755 # 4 - SUID
2755 # 2 - SGID


# /usr/bin/passwd has special permission
# rws - where |s| is special execute permission
# s : user able to execute file as root even without sudo
ls -l /usr/bin/passwd
-rwsr-xr-x 1 root root 47032 May 16  2017 /usr/bin/passwd

cp /usr/bin/passwd /tmp/new-passwd
-rwxr-xr-x  1 mishauser mishagroup 47032 Jan  6 17:05 /tmp/new-passwd

# currently /tmp/new-passwd will fail because it has no permission to write to /etc/passwd
chmod 4775 /tmp/new-passwd # setting SUID permission to a file








