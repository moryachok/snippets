#!/usr/bin/env bash

############################################
#### PIPES #################################
############################################

# multiple pipes with final output to file
ls /etc/ | grep cron | grep daily > grep.txt

# pipe to sort command and show output in less editor
ls /etc | sort -f | less

# search pattern in file
grep ^hello test.txt 

# count all appearances of a pattern in a file
grep -c hello test.txt 

# search for character appearances in a file
grep [l] test.txt 
grep [lajn] test.txt 
grep ^[lajn] test.txt 
grep [a-g] test.txt # all the characters between specified
grep [1-9] test.txt # all the numbers between specified

# -i case insensitive
grep -i hello test.txt

# grep with pattern from a file
grep -f patterns.txt file.txt

# look for pattern in files (-l) recurcively (-r)
grep -lr cron  /etc


############################################
#### EGREP & FGREP #########################
############################################

# .* AND operator
egrep 'pattern.*possible' file.txt 

# |  OR operator
egrep 'pattern|possible' file.txt

# return all that NOT (-v) match  `pattern` or `possible`
egrep -v 'pattern|possible' file.txt

# look for $ sign
fgrep $ file.txt 