Rails.application.routes.draw do
  devise_for :users

  resources :images, :path => 'i'

  get '/new' => 'images#index'

  root to: 'images#new'
end
