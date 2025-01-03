Rails.application.routes.draw do
  resources :comments
  resources :likes, only: [ :create, :destroy ]
  delete "unlike/:id", to: "likes#destroy", as: "unlike"

  devise_scope :user do
  get "/users", to: "devise/registrations#new"
  get "/users/password", to: "devise/passwords#new"
  get "/users/sign_out" => "devise/sessions#destroy"
end

  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :users, only: [ :show ]
  get "home/about"

  get "posts/myposts"
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "posts#index"
end
