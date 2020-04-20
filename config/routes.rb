Rails.application.routes.draw do
  devise_for :users
  root "categories#index"
  resources :users, only: [:edit, :update]
  resources :users, except: [:edit, :update] do
    resources :categories, only: [:index] do
      resources :posts, only: [:index, :create, :edit, :update, :destroy] do
        collection do
          delete 'destroy_all'
        end
      end
    end
  end
end
