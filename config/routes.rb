Rails.application.routes.draw do
  devise_for :users
  root "categories#index"
  resources :users, only: [:edit, :update]
  resources :users, except: [:edit, :update] do
    resources :categories, only: [:index] do
      resources :posts, only: [:index, :create, :edit, :update, :destroy]
    end
  end
end
