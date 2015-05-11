Rails.application.routes.draw do
  devise_for :doctors, controllers: { registrations: "doctors/registrations" }
  resources :doctors

  resources :clinics

  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :users
  
  root to: 'visitors#index'
end
