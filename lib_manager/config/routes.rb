Rails.application.routes.draw do
  root "static_pages#show", page: "home"
  get "/static_pages/*page" => "static_pages#show"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, except: [:new, :destroy]

  resources :publishers, only: :show

  resources :books, only: [:index, :show]

  resources :authors, only: :show

  resources :categories, only: :show

  namespace :admin do
    resources :users
    resources :publishers, except: :show
    resources :authors, except: :show
    resources :categories
    resources :xml, only: :index
  end
end
