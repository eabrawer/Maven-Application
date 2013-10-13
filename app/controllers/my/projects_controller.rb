class My::ProjectsController < ApplicationController
	before_filter :require_login
	
	def index
		@projects = current_user.projects
	end
end
