Rails.application.routes.draw do
  resources :listings
  resources :conversations do 
    resources :messages
  end
  resources :messages
  devise_for :installs
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :members
  resources :blog_posts

  get '/users/:user_id/conversations', to: 'conversations#index'
  get '/users/:user_id/listings', to: 'listings#index'

  # Defines the root path route ("/")
  root "blog_posts#index" 
end
