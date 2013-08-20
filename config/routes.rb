DeliverySystem::Application.routes.draw do


	devise_for :users
  resources :users
  resources :restaurants
  resources :products
  resources :categories
  resources :photo
  # root to: redirect('/users/sign_in')
  root to: 'home#index'
end
