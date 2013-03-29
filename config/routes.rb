CmmTodo::Application.routes.draw do
  match '/login', :to => "users#login", :via => [:get]
  match '/signin', :to => "users#signin", :via => [:post]
  match '/logout', :to => "users#logout", :via => [:get]

  resources :users
	resources :projects 

	root :to => "main#index"
end
