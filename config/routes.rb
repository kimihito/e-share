EShare::Application.routes.draw do
  resources :favorite_videos

  resources :watch_histories, only: [:create, :destroy]
  resources :favorite_videos, only: [:create, :destroy]
  get 'user_login' => 'users#login'
  resources :users, only: [:create, :show]
  root to: 'home#index'
end
