############################################
#######  DEFAULT ROUTES ####################
############################################

users     GET     /users          {action: "index",   controller: "users"}
users     POST    /users          {action: "create",  controller: "users"}
new_user  POST    /users/new      {action: "new",     controller: "users"}
edit_user GET     /users/:id/new  {action: "edit",    controller: "users"}
user      GET     /users/:id      {action: "show",    controller: "users"}
user      PUT     /users/:id      {action: "update",  controller: "users"}
user      DELETE  /users/:id      {action: "destroy", controller: "users"}

############################################
#######  CUSTOM ROUTINGS ###################
############################################

MishaApp::Application.routes.draw do
  # Nested resources
  # /users/4/friends - get all friends of user
  # /users/4/friends/1 - get specific friend of user
  resources :users do
    resources :friends
  end
  
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

############################################
#######  COLLECTION & MEMBER ###############
############################################

# first way to use it
# one method/action per type
MishaApp::Application.routes.draw do
  resources :users do
    resources :friends
    
    # POST users/4/unfriend
    post :unfriend,     on: :member
    
    # POST users/search
    post :search, on: :collection
  end
end


# second way to use it
# type blocks
MishaApp::Application.routes.draw do
  resources :users do
    resources :friends
    
    member do
      # POST users/4/unfriend
      post :unfriend
    end
    
    collection do
      # POST users/search
      post :search
    end
    
  end
end