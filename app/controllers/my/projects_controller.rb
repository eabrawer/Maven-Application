class My::ProjectsController < ApplicationController
	before_filter :require_login
	
	def index
		@projects = current_user.projects.paginate(:page => params[:page], :per_page => 2)
      .find_with_reputation(:votes, :all, :order => "votes desc")

	end
end
