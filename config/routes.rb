Rails.application.routes.draw do
<<<<<<< HEAD
  resources :products
  resources :plans
  resources :subscriptions
  resources :customers
=======

  resources :products,
            :plans,
            :subscriptions,
            :customers
>>>>>>> 38da3e0d0e2d0fe9e3befeffe3fd4dc6be73dcdc
end
