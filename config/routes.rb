Rails.application.routes.draw do
  resources :products
  resources :plans
  resources :subscriptions
  resources :customers
end
