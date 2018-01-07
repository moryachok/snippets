#!/usr/bin/env bash


####################################################
### PS COMMANDS  ###################################
####################################################

ps # show processes of cur user

ps a #show all processes 

ps au #all processes for all users

ps aux # all processes include boot processes, for mac use: ps -ef

ps -lu user # show process priorities for current user

pstree # shows processes aspstree -a tree 

pstree -a # ps tree with the actual command printed

pstree -a -p # pstree with process ids


####################################################
### KILLING PROCESSES  #############################
####################################################

SIGHUP  # 1  - the clean way to kill process, may be ignored                    , kill 
SIGING  # 2  - interrupts the process, may be ignored                           , kill -2
SIGKILL # 9  - kill process, sure execution                                     , kill -9
SIGTERM # 15 - process termination, cannot be ignored                           , kill -15
SIGSTOP # 19 - stops, but not kill the process                                  , kill -19
SIGTSTP # 20 - stop the process while running it in the background              , kill -20


killall nginx # killing all the processes under name nginx

pkill -SIGHUP -U user # kill all the processes of the specified user


####################################################
### SYSTEM COMMANDS  ###############################
####################################################


free # get memory overview info

free -hm # get mem info in megabytes

uptime # The current time, how long the system has been running, how many users are currently logged


####################################################
### BG and FOREGROUND COMMANDS  ####################
####################################################

jobs # print all paused processes for cur user

bg # run process with + sign from the `jobs` command

bg [id] # will run process by id from `jobs` command

fg # moves process `jobs` with + to the foreground

fg [id] # # moves process `jobs` id to the foreground


####################################################
### PRIORITIES  ####################################
####################################################

# The lower priority process has, the more resources It will receive.
# default priority = 80

nice ./script.sh # will rise priority by 10 points
renice +10 {PID} # will set modifier o +10, default is 0, set lower priority
renice -10 {PID} # smallest modified = largest priority






