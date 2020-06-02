Rails.application.routes.draw do
  root 'pages#home'
  resources :reservations, except: [:edit, :show]
  get 'signup', to: 'users#new'
  resources :users, except: [:new, :show, :index]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
