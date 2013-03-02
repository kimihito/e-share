EShare::Application.routes.draw do
  resources :favorite_videos

  resources :watch_histories, only: [:create, :destroy]
  get 'users/login' => 'users#login'
  resources :users, only: [:show, :create]
  get "user/index"
  get 'user'              => 'user#index', as: 'user'
    get 'user/login' => 'user#login'
  root to: 'home#index'
end
