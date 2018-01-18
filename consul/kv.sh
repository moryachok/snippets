
######################################################
### GET/SELECT #######################################
######################################################

consul kv get prefix/key # getting value of prefix/key
consul kv get -detailed prefix/key # getting details about the value like: index, key, flags, etc...

consul kv get -recurse # get al keys

######################################################
### UPDATE/INSERT ######################################
######################################################

consul kv put prefix/key someval # insert someval to prefix/key
consul kv put -flags=42 prefix/key someval

# -cas - will put new value only if it differs
consul kv put -cas -modify-index=123 somekey someval 
######################################################
### DELETE ###########################################
######################################################


consul kv delete prefix/key   # deletes particular key 

consul kv delete -recurse prefix # deletes all keys starting with "prefix"
