require 'sidekiq/web'

Rails.application.routes.draw do
  resources :requests, except: %i[edit update destroy] do
    post :contacts, on: :member
    resources :comments, only: %i[index show new create]
  end

  get '/about', to: 'home#about'
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :notifications, only: [:index], export: true
  resources :announcements, only: [:index], export: true
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: redirect('/requests')
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
