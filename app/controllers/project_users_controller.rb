class ProjectUsersController < ApplicationController

  def create
  	@project_user = ProjectUser.new(params[:project_user])
  	if @project_user.save
  		redirect_to @project_user.project, :notice => "Group member was successfully added"
  	end
  end

  # def destroy
  # 	@project_user = ProjectUser.find(params[:id])
  # 	@project_user.destroy
  # 	redirect_to project_path
  # end

end
