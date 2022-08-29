Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :profiles, only: [:create, :show, :update]
  resources :tools
  resources :lists, only: [:create, :destroy, :show]
  resources :bookmarks, only: [:create, :destroy]

  # Defines the root path route ("/")
  # root "articles#index"
end
