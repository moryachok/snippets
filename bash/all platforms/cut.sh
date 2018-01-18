#!/usr/bin/env bash

# cutting username from /etc/passwd file
# -f1  first string splitted
# -d: set ":" as delimiter
cut -f1 -d: /etc/passwd

# delimiter ,
# second item returned
SUBSTRING=$(echo $INPUT| cut -d',' -f 2)

grep "" google.txt | rev |cut -d ' ' -f1>font_names.txt