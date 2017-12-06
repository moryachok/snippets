#!/usr/bin/env bash

# https://habrahabr.ru/company/ruvds/blog/327754/
# THIS SCRIPT WILL CONTAIN SOME EXAMPLES OF USING AWK FUNCTION IN BASH

# USAGE SCHEME
# awk options program file

# $0 — представляет всю строку текста (запись).
# $1 — первое поле.
# $2 — второе поле.
# $n — n-ное поле.

###### BASIC COMMANDS

awk '{print $1}' file.txt                                           # printing first word of each line in a file
awk -F: '{print $1}' /etc/passwd                                    # printing first word of each line before semicolon

###### MULTIPLE COMMANDS

echo "My name is Tom" | awk '{$4="Adam"; print $0}'                 # My name is Adam
awk -F: -f ./awk_commands /etc/passwd                               # Running awk commands from the file


###### BEFORE AND AFTER

awk 'BEGIN {print "The File Contents:"} {print "* " $0}' file.txt   # prints "The File Contents:" before the script execution
awk '{print $0} END {print "End of File"}' file.txt                 # prints "End of File" after the script execution

###### Finished at: Встроенные переменные: настройка процесса обработки данных

