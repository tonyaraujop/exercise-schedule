Rails.application.routes.draw do
  resources :routines
  resources :exercises
  root 'routines#index'
  devise_for :users
end
