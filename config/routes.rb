Rails.application.routes.draw do

  devise_for :users
  resources :products
  resources :plans
  resources :subscriptions
  resources :customers

  root "products#index"
end


