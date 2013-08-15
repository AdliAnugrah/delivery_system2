DeliverySystem::Application.routes.draw do

	devise_for :users
  resources :users
  resources :restaurants
  resources :products
  resources :categories
  
  root to: redirect('/users/sign_in')
  
end
