################################################ 
######## READ/SELECT ###########################
################################################

u = User.find(3) # select * from `users` where id = 3

users = User.find(3,4,5) # select * from `users` where id in (3,4,5)

User.first # select * from `users` order by id ASC limit 1

User.last # select * from `users` order by id DESC limit 1

User.all # select * from `users`

User.count # select count(*) from users

User.order(:name) # select * from `users` order by name ASC

User.limit(10) # select * from `users` limit 10

User.where(name: "Misha") # select * from `users` where name = "Misha"


################################################ 
######## INSERT/CREATE #########################
################################################

u = User.new 
u.name = "misha"
u.relationship_status = "still_free"
u.save

# OR

u = User.new(
  name: "Misha",
  relationship_status: "still_free"
)
u.save

# OR - no u.save needed for this method
User.create(
  name: "Misha",
  relationship_status: "still_free"
)

################################################ 
######## UPDATE ################################
################################################

u = User.find(2) 
u.relationship_status = "now catched"
u.has_friends = "yes"
u.save

# OR

u = User.find(2) 
u.attributes = {
  has_friends: "yes",
  relationship_status: "life is still good"
}
u.save

# OR - no u.save needed for this method
User.update(
  has_friends: "yes",
  relationship_status: "life is still good"
)


################################################ 
######## DELETE ################################
################################################

u = User.find(2) 
u.destroy

# OR

User.find(2).destroy

# OR

User.destroy_all # truncate `users`
