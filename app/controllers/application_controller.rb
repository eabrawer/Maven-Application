class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

### Manual login without sorcery
# private

# def current_user
#     @current_user ||= User.find(session[:user_id]) if session[:user_id]
# rescue 
#     # ActiveRecord::RecordNotFound
#     @current_user = nil
#     session[:user_id] = nil
# end

# helper_method :current_user
	

end