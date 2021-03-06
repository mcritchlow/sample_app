class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
      @user = User.new(params[:user])
      if @user.save
        # Handle a successful save.
        #flash[:success] = "Welcome to the Sample App!"
        sign_in @user
        redirect_to @user, notice: "You did it! Welcome to the app!"
      else
        render 'new'
      end
  end
end
