Rails.application.routes.draw do


  root to: 'pages#home'
  get 'pages/about'

  devise_for :users
  #resources :users

  resources :contacts, only: :create
  get 'contact-us', to: "contacts#new", as: 'new_contact'

end
