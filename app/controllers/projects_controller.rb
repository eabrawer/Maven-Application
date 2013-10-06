class ProjectsController < ApplicationController
  
  def index
  	@projects = Project.all
  end

  def show
  	@project = Project.find(params[:id])
  end

  def edit
  	@project = Project.find(params[:id])
  end

  def update
  	@project = Project.find(params[:id])
  	if @project.update_attributes(project_params)
  		redirect_to project_path
  	else 
  		render "edit"
  	end
  end 

  def new
  	@project = Project.new
  end

  def create
  	@project = Project.new(project_params)
  	if @project.save
  		redirect_to @project
  	else
  		render "new"
  	end
  end

  def destroy
  	@project = Project.find(params [:id])
  	@project = Project.destroy
  	redirect_to projects_url
  end

  def project_params
  	params.require(:project).permit(:user, :essay, :title)
  end

end
