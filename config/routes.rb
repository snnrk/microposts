Rails.application.routes.draw do
  root to: 'static_pages#home'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'

  resources :favorites, only: [:create, :destroy]
  resources :microposts, only: [:create, :dewstroy, :new]
  resources :relationships, only: [:create, :destroy]
  resources :sessions, only: [ :new, :create, :destroy ]
  resources :users do
    member do
      get :followings, :followers, :favorites
    end
  end
end
