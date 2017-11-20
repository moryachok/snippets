# chef local development config file
# This file should be created at ~/.chef/config.rb


cookbook_path ['~/chef-repo/cookbooks']
local_mode true # when running knife, it will run on local machine
if File.basename($PROGRAM_NAME).eql?('chef-repo') && ARGV[0].eql?('generate')
    chefdk.generator.license = "all_rights"
    chefdk.generator.copyright_holder = "Student Name"
    chefdk.generator.email = "you@example.com"
    chefdk.generator_cookbook = "~/chef-repo/generator/lcd_origin"
end


