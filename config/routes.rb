Rails.application.routes.draw do

  resources :products,
            :plans,
            :subscriptions,
            :customers
end
