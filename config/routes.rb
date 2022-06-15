Rails.application.routes.draw do
  #get 'home/index'
  devise_for :employees
  root to: "home#index"
  resources :educations
  resources :skills
  resources :certificates
  resources :experiences 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
