class ProjectsController < ApplicationController
  
  def index
    if current_user
      @projects = current_user.projects.paginate(:page => params[:page], :per_page => 2)
      .find_with_reputation(:votes, :all, :order => "votes desc")
    else
  	  @projects = Project.scoped.order('projects.created_at DESC').page(params[:page])
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

  def vote
    value = params[:type] == "up" ? 1 : -1
    @project = Project.find(params[:id])
    @project.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, :notice => "Thank you for voting!"
  end

end
