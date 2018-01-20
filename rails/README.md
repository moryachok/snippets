To start with RAILS:

1. install rvm
2. install ruby 
3. gem install rails
4. gem install bundler
5. rails new NewAppName
6. rails generate scaffold users name:string age:integer
7. rails generate migration AddGenderToUsers gender:string
8. rake db:migrate
9. rails server (will listen on localhost:3000)


Creating a model:

1. rails generate model user name:string age:integer
2. rake db:migrate