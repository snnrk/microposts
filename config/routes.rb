Rails.application.routes.draw do
  root to: 'static_pages#home'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'

  resources :microposts
  resources :relationships, only: [:create, :destroy]
  resources :sessions, only: [ :new, :create, :destroy ]
  resources :users
  get '/followers/:id', to: 'users#followers', as: 'follower'
  get '/followings/:id', to: 'users#followings', as: 'following'

end
