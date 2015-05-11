Rails.application.routes.draw do
  devise_for :doctors
  resources :doctors
  resources :clinics
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
