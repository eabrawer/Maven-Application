class CommentsController < ApplicationController
	before_filter :load_project

  def create
  	@comment = current_user.comments.build(comment_params)
  	@comment.project_id = @project.id
  	if @comment.save
  		redirect_to @project, :notice => "Comment was successfully created."
  	else
      flash.now[:alert] = "Comment was not created"
  		render "new"
  	end
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment.destroy
	  redirect_to @project
  end 

  def comment_params
  	params.require(:comment).permit(:text)
  end

  def load_project
    @project = Project.find(params[:project_id])
  end

  def vote
    value = params[:type] == "up" ? 1 : -1
    @comment = Comment.find(params[:id])
    @comment.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, :notice => "Thank you for voting!"
  end
end
