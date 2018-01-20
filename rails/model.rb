##################################
####  VALIDATIONS  ###############
##################################

class Zombie < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
end

##################################
####  RELATIONS  #################
##################################

class Zombie < ActiveRecord::Base
  validates :name,  presence: true,  uniqueness: true
  has_many :weapons
  has_one :brain, foreign_key: :brain_id
end

class Weapon < ActiveRecord::Base
  belongs_to :zombie
end

Zombie.find(3).weapons

##################################
####  CALLBACKS  #################
##################################

class Zombie < ActiveRecord::Base
  before_validation
  after_validation
  
  before_save
  after_save
  
  before_create
  after_create
  
  before_update
  after_update
  
  before_destroy
  after_destroy
end

#############################################
### MODEL ASSOCIATIONS  #####################
#############################################

class User < ApplicationRecord
  has_many :associations
  has_many :friends, through :associations
end 

class Association < ApplicationRecord
  belongs :user
  belongs_to :friend
end 

class Friend < ApplicationRecord
  has_many :associations
  has_many :users, through :associations
end 


#############################################
### JSON MANIPULATIONS  #####################
#############################################
# filter options
def as_json(options = nil)
  super(options || 
        {include: :friends, except: [:created_at, :updated_at, :id]})
end

# nested filter options
def as_json(options = nil)
  super(options || 
        {include: {friends: {only: [:name, :id]}}, 
        except: [:created_at, :updated_at, :id]})
end
