Rails.application.routes.draw do
  root  "static_pages#home"
  get   "sessions/new"
  get   "menus/index"
  post  "spin_gacha", to: "menus#spin_gacha"
  post  "toggle",     to: "menus#toggle_fav"
  get   "menus/favs", to: "menus#fav_menus"
  get   "/login",     to: "sessions#new"
  post  "/login",     to: "sessions#create"
  get   "/logout",    to: "sessions#destroy"
  get   "/signup",    to: "users#new"
  resources :users
end
