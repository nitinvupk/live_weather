Rails.application.routes.draw do
  resources :cities, only: [:create, :destroy]
end
