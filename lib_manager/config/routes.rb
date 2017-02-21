Rails.application.routes.draw do
  root "static_pages#show", page: "home"
  get "/static_pages/*page" => "static_pages#show"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:show, :edit, :update]

  resources :publishers, only: :show

  resources :books, only: [:index, :show]

  resources :authors, only: :show

  resources :borrows, except: :show

  resources :comments, only: :create

  resources :relationships, only: [:index, :create, :destroy]

  namespace :admin do
    resources :users
    resources :publishers
    resources :authors
    resources :categories, except: :show
    resources :books
    resources :borrows, only: :update
  end
end
