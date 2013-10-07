class ProjectsController < ApplicationController
  
  def index
    if params[:user_id]
      @projects = current_user.projects
    else
  	  @projects = Project.all
    end
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
  	@project = current_user.projects.build(project_params)
    @project.user_id = current_user.id
  	if @project.save
  		redirect_to @project
  	else
  		render "new"
  	end
  end

  def destroy
  	@project = Project.find(params[:id])
  	@project.destroy
  	redirect_to projects_url
  end

  def project_params
  	params.require(:project).permit(:user, :essay, :title)
  end

end