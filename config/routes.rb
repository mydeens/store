Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :products
  resources :categories
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :payments, only: [:new, :create]
  get "payments/verify", to: 'payments#show_verify', as: 'verify'
  post "payments/verify"
  post "payments/resend"

end
