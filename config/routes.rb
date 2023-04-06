Rails.application.routes.draw do
  root 'users#index'
  get 'about', to:'users#about'
  get 'contact', to:'users#contact'
  get 'before_use', to:'users#before_use'
  resources :users
  resources :easy_medical_checkup
end
