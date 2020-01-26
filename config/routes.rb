Rails.application.routes.draw do
  devise_for :users
  root "categories#index"
  resources :users, only: [:edit, :update]
  resources :categories, only: [:index]
end