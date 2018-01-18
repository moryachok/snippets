class UsersController < ApplicationController
  # Methods are corresponding to the views names
  # show() handles views/show.html.erb
  # @ will configure scope, in that way view will "see" user variable
  def show 
    @user = User.find(1)
  end
  
  # will render /views/status.html.erb 
  def show
    @user = User.find(1)
    render action: 'status' 
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
  #### USING FORMATS: html,json,xml #######
  #########################################
  
  def show 
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # will render show.html.erb
      format.json {render json: @user}
      format.xml {render xml: @user}
    end   
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