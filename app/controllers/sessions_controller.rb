class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:email], params[:password], params[:rememeber_me])
    
    if user
      redirect_back_or_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Email or password was invalid"
      render "new"
    end  	


   #  user = User.find_by_email(params[:email])
  	# if user && user.authenticate(params[:password])
  	# 	session[:user_id] = user.id
  	# 	redirect_to user, :notice => "You are loged in"
  	# else
  	# 	flash.now[:alert] = "You are not logged in"
  	# 	render "new"
  	# end
  end

  def destroy
    logout
    redirect_to root_url, :notice => "Logged out!"

  	# session[:user_id] = nil
  	# redirect_to projects_url, :notice => "Logged out!"
  end
end
