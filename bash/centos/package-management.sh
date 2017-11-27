#!/usr/bin/env bash


########### RPM ###########

# installing previously downloaded file
rpm -ihv {file.rpm}

rpm -q {package} # query for installed package info
rpm -qi {package} # query with more informative package info

# uninstall package via rpm
rpm -e {package}



########### YUM ###########

# list all yum package repos
ls -l /etc/yum.repos.d/

# search for a package
yum search {package}

yum deplist {package} # list all package dependencies



