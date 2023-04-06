Rails.application.routes.draw do
  root 'users#index'
  get 'about', to:'users#about'
  get 'contact', to:'users#contact'
  get 'before_use', to:'users#before_use'
  get 'survey', to:'easy_medical_checkup#index'
  resource :users
  resource :easy_medical_checkup
end
