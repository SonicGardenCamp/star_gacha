Rails.application.routes.draw do
  root 'static_pages#home'
  get 'help', to: 'static_pages#help'
  post 'spin', to: 'static_pages#spin'
  get 'spin', to: 'static_pages#spin'
  # post 'help', to: 'static_pages#help'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
