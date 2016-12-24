Rails.application.routes.draw do

  get 'contacts/new'

  root to: 'pages#home'
  get 'pages/about'

end
