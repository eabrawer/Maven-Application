Letsmeet::Application.routes.draw do


  get "project_user/create"

  resources :sessions, :only => [:new, :create, :destroy]
  resources :users
  # , :except => [:index]
  resources :project_users, :only => [:create]

  resources :projects do
  	member { post :vote }
		resources :comments, :only => [:create, :destroy, :new] do
			member { post :vote }
		end
  end

  namespace :my do
  	resources :projects, :only => [:index]
  end


get 'tags/:tag', to: 'projects#index', as: :tag
root :to => 'projects#index'

end
