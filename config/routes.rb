Rails.application.routes.draw do
  root 'users#index'
  get 'about', to:'users#about'
  get 'before_use', to:'users#before_use'
  get 'terms_of_use', to:'users#terms_of_use'
  get 'privacy_policy', to: 'users#privacy_policy'
  resources :users
  resources :easy_medical_checkup
  resources :full_medical_checkup
end
