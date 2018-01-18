puts "Hello Misha"

grade="W"
case grade
when "A", "B", "W"
  puts 'When Tal will ask you if you checked this...'
when "C", "D"
  puts 'Show this to him!'
else
  puts "So who is the greatest DevOps in universe now? :)))"
end


#################################################
#################### HASHES  ####################
#################################################

hash.values.each { |val| p val }

#################################################
#################### FILES  #####################
#################################################
# sample.txt
#1. city: Dnepropetrovsk
#2. name: Misha
File.foreach("/sample.txt") do |line|
    prop, val = line.split(': ')
    # prop = city, val = Dnepropetrovsk
    # prop = name, val = Misha
end




