Rails.application.routes.draw do
  namespace :api do
    namespace :my do
      resources :minions
    end
    resources :jobs
    resources :minions
    resources :players
  end

  # Add route for signup at /players/signup
  post '/login', to: 'authentication#login'
  post '/register', to: 'authentication#register'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
