Rails.application.routes.draw do
  devise_for :users
  root to: "dashboard#reccomend"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :tools do
    resources :reviews, except: [:index, :show, :destroy, :update, :edit]
  end
  resources :tools do
    resources :bookmarks, only: [:new, :create, :edit, :update]
  end
  resources :bookmarks, only: :destroy
  resources :reviews, only: [:destroy, :update, :edit]
  resources :lists
  resources :profiles

  get "test", to: "pages#test"
  get "dashboard", to: "dashboard#reccomend"
  # resources :dashboard, only: [:show, :index]

  # Defines the root path route ("/")
end
