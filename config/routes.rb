CmmTodo::Application.routes.draw do
  match '/login', :to => "users#login", :via => [:get]
  match '/signin', :to => "users#signin", :via => [:post]
  match '/logout', :to => "users#logout", :via => [:get]

  resources :users

	resources :projects do
		member do
			match 'cancel', :via => [:get]
		end
	end

	resources :tasks do
		member do
			post 'take'
			post 'done'
			post 'drop'
			get 'cancel'
		end
	end

	root :to => "main#index"
end
