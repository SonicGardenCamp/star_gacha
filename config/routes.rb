Rails.application.routes.draw do
  root 'static_pages#home'
  post '/', to: 'static_pages#home'
  get 'help', to: 'static_pages#help'
  get 'menus/index'

  resources :users
end
