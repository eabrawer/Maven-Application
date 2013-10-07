Letsmeet::Application.routes.draw do

  resources :sessions, :only => [:new, :create, :destroy]
  resources :users do
  	resources :projects
  end

  resources :projects

end
