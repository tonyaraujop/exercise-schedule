Rails.application.routes.draw do
  resources :routines
  resources :exercises
  devise_for :users, controllers: { confirmations: 'confirmations' }
  root 'routines#index'
end
