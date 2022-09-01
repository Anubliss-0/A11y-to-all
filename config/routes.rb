Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :tools do
    resources :reviews, except: [:index, :show, :destroy, :update, :edit]
  end
  resources :reviews, only: [:destroy, :update, :edit]
  resources :lists
  resources :bookmarks, only: [:create, :destroy]
  resources :profiles

  get "test", to: "pages#test"
  get "dashboard", to: "pages#dashboard"

  # Defines the root path route ("/")
  # root "articles#index"
end
