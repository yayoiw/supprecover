Rails.application.routes.draw do
  root 'users#index'
  get 'about', to:'users#about'
  get 'before_use', to:'users#before_use'
  get 'terms_of_use', to:'users#terms_of_use'
  get 'privacy_policy', to: 'users#privacy_policy'
  post 'set_agree_cookie', to: 'users#set_agreement'
  resources :users, only: [:index, :create] do
    resource :easy_medical_checkups, only: [:new, :show, :create]
    resource :full_medical_checkups, only: [:new, :show, :create]
  end
end
