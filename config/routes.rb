Letsmeet::Application.routes.draw do


  resources :sessions, :only => [:new, :create, :destroy]
  resources :users

  resources :projects do
	resources :comments, :only => [:create, :destroy, :new] do
		member { post :vote }
	end
  end



root :to => "sessions#new"

end
