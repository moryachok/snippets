# By default each method corresponds to /views/{method name}.html.erb
# 

class UsersController < ApplicationController
  
  # global middleware, that  will apply before specified methods
  before_action :helper_method, only: [:edit, :update, :destroy]
  
  def helper_method
    @user = User.find(params[:id])
  end
  
  def index     # List all users, index.html.erb
  def show      # Show a single User, show.html.erb
  def new       # Show new user form, -||-
  def edit      # Show an edit user form , -||-
  def create    # create a new user, -||-
  def update    # update user, -||-
  def destroy   # delete user, -||-
    
end 