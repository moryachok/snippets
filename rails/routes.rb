# Configure custom routings

MishaApp::Application.routes.draw do
  resources :users
  
  # SPECIFY ROOT
  root to: "users#index" 
  # OR
  match '/', :to => "users#index", :as => "root_path"
  
  
  # will call UsersController.index() method
  # as: = in .erb  use <%= link_to "somelink", list_all_users_path %> 
  get '/all' => "users#index", as: "list_all_users" 
  
  get '/all_users' => redirect('/users')
  
  # in UsersController.rb check for params[:zipcode]
  get '/all_users/:zipcode', :to => "users.index", as: "list_all_users_with_zipcode"
  
end