Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items
  resources :orders
  resources :orders, only:[:create]
end
