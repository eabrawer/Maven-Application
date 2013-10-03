class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		sessions[:user_id] = user.id
  		redirect_to @product, :notice => "You are loged in"
  	else
  		flash.now[:alert] = "You are not logged in"
  		render "new"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to @projects_url, :notice => "Logged out!"
  end
end
