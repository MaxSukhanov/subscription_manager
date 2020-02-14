Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products do
    resources :plans
  end
  resources :subscriptions, :customers
end
