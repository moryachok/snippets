# Create new app structure in current directory
rails new NewAppName

# runs rails local server on port 3000
# dependent on NodeJS
rails server 

#################################
########### GENERATORS ##########
#################################

# generate files in:
#   app/models
#   app/views
#   app/controllers
# Creates a table `zombies`:
#   db/migrate/{timestamp}_create_zombies.rb
rails generate scaffold zombie name:string bio:text age:integers generate scaffold zombie


# Generate migration
# AddFieldsToTable - will generate add_fields_to_table
rails generate migration AddFieldsToTable field1:string, field2:boolean

rails generate migration RemoveFieldsFromTable field1:string


# Generate model
rails generate model brain zombie_id:integer


#########################################################
####  RAKE COMMANDS  ####################################
#########################################################

# running migration
# from the application root folder
rake db:migrate

# undo the most recent migration
rake db:rollback

# remove all the migrations
rake db:schema:dump

# will create db according to schema.rb
rake db:setup

# prints all existing routes
bundle exec rake routes