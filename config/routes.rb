Rails.application.routes.draw do
  get 'menus/index'
  devise_for :users

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end

  root 'home#index'

  resources :categories, only: %i[index new show create destroy update edit] do
    resources :transactions, only: %i[index new show create destroy update edit]
  end
  resources :menus
end
