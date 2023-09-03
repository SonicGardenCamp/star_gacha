Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  post '/', to: 'static_pages#home'
  get 'help', to: 'static_pages#help'
  get 'menus/index'
  post 'menus/index'
  post  "menus/favs", to: "menus#fav_menus"
  get   "menus/favs", to: "menus#fav_menus"
  post "toggle", to: "menus#toggle_fav"
  post "spin_gacha", to: "menus#spin_gacha"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  get "/logout",  to: "sessions#destroy"
  get    "/signup",  to: "users#new"
  resources :users
end
