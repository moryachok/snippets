##################################
####  BASE MODELS  ###############
##################################

class Zombie < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
end

##################################
####  RELATIONS  #################
##################################

class Zombie < ActiveRecord::Base
  validates :name, 
            presence: true, 
            uniqueness: true
  has_many :weapons
end

class Weapon < ActiveRecord::Base
  belongs_to :zombie
end

Zombie.find(3).weapons









