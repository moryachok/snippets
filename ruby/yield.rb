###################################################
#####  YIELD == BLOCK.CALL ########################
###################################################

def my_method_with_yield
  puts "started"
  yield("Misha", 28)
  puts "finished"
end

def my_method_with_block(&block)
  puts "started"
  block.call("Misha", 28)
  puts "finished"
end

my_method_with_yield do |name,age|
  puts "name: #{name}, age: #{age}"
end

my_method_with_block do |name,age|
  puts "name: #{name}, age: #{age}"
end




###################################################
##### YIELD WITH CLASSES  #########################
###################################################

class Car
  attr_accessor :color, :doors

  def initialize
    yield(self)
  end
end

car = Car.new do |c|
  c.color = "Red"
  c.doors = 4
end

puts "My car's color is #{car.color} and it's got #{car.doors} doors."










