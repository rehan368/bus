Rails.application.routes.draw do
  root 'pages#home'
  resources :reservations, except: [:edit, :show]
end
