require 'sidekiq/web'

Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  resources :requests, except: %i[index new destroy] do
    get '/', to: redirect('/requests/asks'), on: :collection
    get :contacts, on: :member
    %w[ask provide].each do |type|
      get type.pluralize, on: :collection, action: 'index', type: type
      get "#{type.pluralize}/new", on: :collection, action: 'new', type: type
    end

    resources :comments, only: %i[index show new create]
  end
  resources :warnings, only: %i[index update]

  get '/about', to: 'home#about'
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :notifications, only: [:index], export: true
  resources :announcements, only: [:index], export: true
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: redirect('/requests/asks')
end
