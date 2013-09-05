DeliverySystem::Application.routes.draw do



  resources :checkout, only: [:create]

  get "search/index"

	devise_for :users
  resources :orders
  resources :users
  resources :restaurants
  resources :products
  resources :categories
  resources :photo
  resources :districts
  # root to: redirect('/users/sign_in')
  root to: 'home#index'
end
