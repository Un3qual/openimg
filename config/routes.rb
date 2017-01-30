Rails.application.routes.draw do
  
	devise_for :users
	as :user do
		get 'login', to: 'devise/sessions#new'
		get 'register', to: 'devise/registrations#new'
		delete 'logout', to: 'devise/sessions#destroy'
	end

	match '@:username' => 'users#show', as: :user, via: :get

	resources :images, :path => 'i' do
		#soon
		#resources :flags
	end

	post "/i/:id/admin_delete" => "images#admin_delete", as: "admin_delete_image"
	get "/i/:id/admin" => "images#admin_actions", as: "admin_actions_image"

	get '/new' => 'images#index'

	root to: 'images#new'
end
