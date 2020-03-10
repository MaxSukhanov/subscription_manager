Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :products
    resources :plans
  end
  
  resources :subscriptions
  resources :customers
end
