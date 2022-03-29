Rails.application.routes.draw do
  resources :routines
  resources :exercises
  devise_for :users
end
