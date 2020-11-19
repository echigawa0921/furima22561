Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :orders
  end

  resources :credit_cards, only: [:show, :destroy] do
    collection do
      post 'pay', to: 'credit_cards#pay'
    end
  end
  
end


