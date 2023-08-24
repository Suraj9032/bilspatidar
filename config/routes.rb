# frozen_string_literal: true

Rails.application.routes.draw do
  post '/auth/login', to: 'authentication#login'
  namespace :api do
    namespace :v1 do
      resources :users
      get 'books', to: 'books#index'
      post 'books', to: 'books#create'
      get 'books/:id', to: 'books#show'
      patch 'books/:id', to: 'books#update'
      delete 'books/:id', to: 'books#destroy'
    end
  end
  get '*unmatched_route', to: 'application#not_found'
end
