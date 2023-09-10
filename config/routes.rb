Rails.application.routes.draw do
  root 'users#index'
  get 'about', to:'users#about'
  get 'before_use', to:'users#before_use'
  get 'terms_of_use', to:'users#terms_of_use'
  get 'privacy_policy', to: 'users#privacy_policy'
  resources :users, only: [:index, :create] do
    resource :easy_medical_checkups, only: [:new, :show, :create, :update]
    resource :full_medical_checkups, only: [:new, :show, :create, :update]
  end
end
