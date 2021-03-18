# config/routes.rb
Rails.application.routes.draw do
  root 'alphablog#index'
  get 'about', to: 'alphablog#about'
  resources :articles, only: [:show, :index, :new, :create]
  resources :bookings, only: [:show]
end
