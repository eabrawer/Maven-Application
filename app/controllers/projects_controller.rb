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
    if current_user
      @user = current_user
      @comment = @project.comments.build
    end
  end

  def edit
  	@project = current_user.projects.find(params[:id])
  end

  def update

  	@project = Project.find(params[:id])

    if current_user != @project.user
      redirect_to "bugger_off", :error => "that project does not belong to you, go away!!!!"
    else
      if @project.update_attributes(project_params)
        redirect_to project_path
      else 
        render "edit"
      end  
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
  	params.require(:project).permit(:user, :essay, :title, :avatar)
  end

end
