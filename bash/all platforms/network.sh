#!/usr/bin/env bash

sudo nmap -sT -O localhost # will show you info about the ports
netstat -anp | grep 8080 # check port is captured
