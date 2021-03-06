class UsersController < ApplicationController
  
  # /users/4
  # /users/4.json
  def show 
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # will render show.html.erb
      format.json {render json: @user}
      format.xml {render xml: @user}
    end   
  end
  
  #########################################
  ###### USING PARAMS #####################
  #########################################

  # GET: /users/3?status=amazing
  def show 
    @user = User.find(params[:id]) # find user with id 3
    @status = params[:status]
  end
  
  # GET: /users?user[status]=amazing
  def show 
    @user = User.find(params[:id]) # find user with id 3
    @status = params[:user][:status]
  end
  
  # POST: /users?user[status]=amazing
  # This will validate request on User creation
  def create 
    @user = User.create(params.require(:tweet).permit([:status, :name])) # creates user with status: amazing    
  end
  
  #########################################
  #### CUSTOMIZED JSON RESPONSE ###########
  #########################################
  
  def get_name
    @user = User.find(params[:id])
    render json: @user.to_json(only: :name)
  end
  
  def get_name_and_age
    @user = User.find(params[:id])
    render json: @user.to_json(only: [:name, :age])
  end
  
  def get_all_except_age
    @user = User.find(params[:id])
    render json: @user.to_json(except: :age)
  end
  
  def include_friends
    @user = User.find(params[:id])
    render json: @user.to_json(include: :friend, except: :age)
  end
  
  
  
  #########################################
  #### REDIRECTS AND FLASH ################
  #########################################
  # in view, notice will be available at flash[:notice]
  
  def not_allowed
    flash[:notice] = "Sorry, go to hell!"
    redirect_to(users_path)
  end
  
  def not_allowed2
    redirect_to(users_path, notice: "Sorry again, but go to hell!")
  end
  
  
  
  
end