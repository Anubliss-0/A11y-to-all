Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :profiles
  resources :tools
  resources :lists
  resources :bookmarks, only: [:create, :destroy]
  resources :profiles, only: [:show, :update, :edit]

  # Defines the root path route ("/")
  # root "articles#index"
end
