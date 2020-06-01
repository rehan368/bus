Rails.application.routes.draw do
  root 'pages#home'
  resources :reservations, except: [:edit, :show]
  get 'signup', to: 'users#new'
  resources :users, except: [:new, :show, :index]
end
