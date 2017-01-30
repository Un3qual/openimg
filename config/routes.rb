Rails.application.routes.draw do
	devise_for :users
	as :user do
		get 'login', to: 'devise/sessions#new'
		get 'register', to: 'devise/registrations#new'
		delete 'logout', to: 'devise/sessions#destroy'
	end

	match '@:username' => 'users#show', as: :user, via: :get

	resources :images, :path => 'i'

	get '/new' => 'images#index'

	root to: 'images#new'
end
