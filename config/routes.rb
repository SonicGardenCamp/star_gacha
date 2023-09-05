Rails.application.routes.draw do
  root  "menus#show"
  
  post  "spin_gacha", to: "menus#spin_gacha"
  post  "toggle",     to: "menus#toggle_fav"
  get   "menus/favs", to: "menus#fav_menus"
  resources :menus, only: [:index, :show]

  get   "/signup",    to: "users#new"
  resources :users, only: [:show, :create]

  get   "/login",     to: "sessions#new"
  post  "/login",     to: "sessions#create"
  get   "/logout",    to: "sessions#destroy"
end
