Rails.application.routes.draw do
  resources :routines
  resources :exercises
  devise_for :users, controllers: { confirmations: 'confirmations',
                                    registrations: 'user/registrations',
                                    sessions: 'user/sessions' }
  root 'routines#index'
end
