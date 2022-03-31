Rails.application.routes.draw do
  resources :routines
  resources :exercises
  devise_for :users
  root 'routines#index'
end
