EShare::Application.routes.draw do
  resources :favorite_videos

  resources :watch_histories, only: [:create, :destroy]
  resources :favorite_videos, only: [:create, :destroy]
  get 'users/login' => 'users#login'
  resources :users, only: [:show, :create]
  root to: 'home#index'
end
