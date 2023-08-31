Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  post '/', to: 'static_pages#home'
  get 'help', to: 'static_pages#help'
  get 'menus/index'
  post "toggle", to: "static_pages#toggle_fav"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  get "/logout",  to: "sessions#destroy"
  get    "/signup",  to: "users#new"
  resources :users
end
