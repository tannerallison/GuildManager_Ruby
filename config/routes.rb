

Rails.application.routes.draw do
  namespace :my do
    resources :minions
  end
  resources :jobs
  devise_for :players
  root to: "players#index"

  # Add route for signup at /players/signup
  post '/login', to: 'authentication#login'

  resources :minions
  resources :players
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
