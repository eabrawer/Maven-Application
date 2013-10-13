Letsmeet::Application.routes.draw do


  resources :sessions, :only => [:new, :create, :destroy]
  resources :users

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
