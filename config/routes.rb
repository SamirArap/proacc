Rails.application.routes.draw do

  root to: 'pages#home'
  get 'pages/about'

  resources :contacts, only: :create
  get 'contact-us', to: "contacts#new", as: 'new_contact'

end
