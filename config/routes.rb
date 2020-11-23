Rails.application.routes.draw do
  #get 'buys/index'
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:new,:create,:show,:edit,:update,:destroy] do
    resources :buys, only: [:index, :create]
  end
end
