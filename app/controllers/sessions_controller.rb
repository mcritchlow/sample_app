class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        # Sign the user in and redirect to the user's show page.
        sign_in user
        redirect_to user, success: "Welcome back #{user.name}!"
      else
        # Create an error message and re-render the signin form.
        #flash[:error] = 'Invalid email/password combination' # Not quite right!
        if user && !user.authenticate(params[:session][:password])
          flash.now[:error] = "We like you, but not your password. Try again"
        else
          flash.now[:error] = "Not even close. CAPS LOCK?"
        end
        render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_url
  end
end
