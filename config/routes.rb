Rails.application.routes.draw do
  resources :images, :path => 'i'

  root to: 'images#new'
end
