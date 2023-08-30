Rails.application.routes.draw do
  get 'users/index'
  get 'users/new'
  get 'users/show'
  get 'users/edit'
  root 'static_pages#home'
  get 'help', to: 'static_pages#help'
  post 'spin', to: 'gacha#spin'
  get 'spin', to: 'gacha#spin'
  # post 'help', to: 'static_pages#help'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
end
