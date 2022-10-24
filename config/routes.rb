Rails.application.routes.draw do
  get 'users/index'
  get 'home/index'
  get 'transactions/index'
  get 'categories/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
