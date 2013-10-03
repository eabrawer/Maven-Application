class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
  		redirect_to user_path :notice => "User was successfully updated."
  	else
      flash.now[:alert] = "User was not updated"
  		render "edit"
  	end
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to @user, :notice => "User was successfully created."
  	else
      flash.now[:alert] = "User was not created"
  		render "new"
  	end
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  		redirect_to new_user_path
  end

  def user_params
  	params.require(:user).permit(:first_name, :last_name, 
  		:email, :password, :password_confirmation)
  end
end
