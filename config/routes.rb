Rails.application.routes.draw do
  root 'alphablog#index'
  get 'about' to: 'alphablog#about'
end
