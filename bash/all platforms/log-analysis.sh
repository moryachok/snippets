ps uax####################################
###### THE FLOW  ###################
####################################

# find string in logfile with line
tail -n 2000 log/development.log| grep -in -C 10 "2018-03-01T11:14:43.980758" 
q
less -J -n log/development.log 

  :45 + g # go to line 45

# Get last 2000 lines
ps -ef | less 

##############################################
# LESS NAVIGATION inside document ############
##############################################  

up arrow - move up 1 line
down arrow - move down 1 line

w - move up 1 page 
f - move down 1 page 

d - move down 10 lines

:20 + w # move up 20 lines
:10 + f # move down 10 lines

"F" # gcapital F will try to reprint new lines

:45 + g # go to line 45

##############################################
######## LESS SPECIALS #######################
##############################################  

m + {any letter} # mark position to return later
'' + {marked letter} # returned to marked position

##############################################
######## LESS SEARCHES #######################
##############################################  

/{some string or regex} # search forward
?{some string or regex} # search back



