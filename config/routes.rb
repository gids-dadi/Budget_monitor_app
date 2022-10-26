Rails.application.routes.draw do
  devise_for :users
 root 'home#index'
  
  resources :categories, only: %i[index] do
    resources :transactions, only: %i[index]
  end
end