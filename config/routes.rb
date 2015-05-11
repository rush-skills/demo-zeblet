Rails.application.routes.draw do
  resources :bookings
  devise_for :doctors, controllers: { registrations: "doctors/registrations" }
  resources :doctors

  resources :clinics

  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :users
  
  get "/clinics/:id/add_doctor", to: "clinics#add_doctor", as: :add_doctor_to_clinic
  post "/clinics/:id/update_doctor", to: "clinics#update_doctor", as: :update_doctor_to_clinic
  get "/clinics/:id/remove_doctor/:did", to: "clinics#remove_doctor", as: :remove_doctor_from_clinic

  get "/mybookings", to: "bookings#index_user", as: :user_bookings
  get "/my_bookings", to: "bookings#index_doctor", as: :doctor_bookings

  root to: 'visitors#index'
end
