#!/usr/bin/env bash

# cutting username from /etc/passwd file
# -f1  first string splitted
# -d: set ":" as delimiter
cut -f1 -d: /etc/passwd