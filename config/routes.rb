# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  get '/help', to: 'pages#help'
  get '/about_us', to: 'pages#about_us'
  resources :cities, only: %i[create destroy show] do
    resources :comments, only: %I[create]
  end
end
