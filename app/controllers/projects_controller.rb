class ProjectsController < ApplicationController
  before_filter :require_login, except: [:index, :show]




  def index
    if params[:tag]
      @projects = Project.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 10)
      .find_with_reputation(:votes, :all, :order => "votes desc")
    else
      @projects = Project.paginate(:page => params[:page], :per_page => 10)
      .find_with_reputation(:votes, :all, :order => "votes desc")
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
      redirect_to @project, :error => "that project does not belong to you, go away!!!!"
    elsif @project.update_attributes(params[:project])
        redirect_to project_path
    else 
        render "edit" 
    end
  end 

  def new
  	@project = Project.new
  end

  def create
  	@project = current_user.projects.build(params[:project])
    @project.user_id = current_user.id
  	if @project.save
  		redirect_to @project
  	else
  		render "new"
  	end
  end

  def destroy
  	@project = Project.find(params[:id])
    if @project = current_user.projects.find(params[:id]) then
  	  @project.destroy
    end
  	redirect_to projects_url
  end

  # def project_params
  # 	params.require(:project).permit(:user, :essay, :title, :avatar)
  # end

  def vote
    value = params[:type] == "up" ? 1 : -1
    @project = Project.find(params[:id])
    @project.add_or_update_evaluation(:votes, value, current_user)
    redirect_back_or_to :notice => "Thank you for voting!"
  end

end
