# config/routes.rb
Rails.application.routes.draw do
  resources :themes
  resources :images
  resources :values
  resources :users
  
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/register',  to: 'users#new'
  post '/register',  to: 'users#create'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  get '/registration_success', to: 'static_pages#registration_success'

  get '/rating', to: 'ratings#index'
  get '/load_image', to: 'ratings#load_image'
  get '/prev_image', to: 'ratings#prev_image'
  get '/next_image', to: 'ratings#next_image'
  post '/rate_image', to: 'ratings#rate_image'
end
