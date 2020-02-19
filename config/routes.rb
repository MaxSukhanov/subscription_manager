Rails.application.routes.draw do

  root_to: "products#index"
  
  namespace :admin do
    resources :products do
      resources :plans
    end
  end
  
  scope module: 'user' do
    resources :products, only: [:index, :show]
  end

  resources :subscriptions

  resources :customers

  resources :sessions, only: [:new, :create, :destroy]
  
  get 'signup', to: 'customers#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
end
