# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  get '/help', to: 'pages#help'
  resources :cities, only: %i[create destroy]
end
