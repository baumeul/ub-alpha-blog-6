# config/routes.rb
Rails.application.routes.draw do
  root 'alphablog#index'
  get 'about', to: 'alphablog#about'
  resources :articles
  resources :bookings, only: [:show, :index, :edit, :update]
end
