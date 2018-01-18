Dir.entries "/"
Dir["/*.txt"]


File.read("/somefile.txt")

File.mtime("/somefile.txt") #2018-01-08 19:00:10 UTC
File.mtime("/somefile.txt").hour # 19


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