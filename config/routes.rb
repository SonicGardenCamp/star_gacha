Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  post '/', to: 'static_pages#home'
  get 'help', to: 'static_pages#help'
  get 'menus/index'
  
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  get "/logout",  to: "sessions#destroy"
  get    "/signup",  to: "users#new"
  resources :users
end
