class UsersController < ApplicationController

  def index
  	@users = User.select("id, name").where("name like ?", "%#{params[:q]}%")
    respond_to do |format|
      format.json { render :json => @users.map(&:attributes) }
    end
  end


  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(params[:user])
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
  	@user = User.new(params[:user])
  	if @user.save
      auto_login(@user)
  		redirect_to @user, :notice => "User was successfully created."
  	else
      flash.now[:alert] = "User was not created"
  		render "new"
  	end
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to projects_path
  end
end
