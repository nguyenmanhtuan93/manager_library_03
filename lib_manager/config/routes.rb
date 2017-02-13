Rails.application.routes.draw do
  root "static_pages#show", page: "home"
  get "/static_pages/*page" => "static_pages#show"

  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:show, :create, :edit]

  resources :publishers, only: :show

  namespace :admin do
    resources :publishers, except: :show
  end
end
