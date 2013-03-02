EShare::Application.routes.draw do
  resources :watch_histories, only: [:create, :destroy]
  resources :users, only: [:show, :create]
  get "user/index"
  get 'eyecatch'          => 'home#eyecatch',    as: 'eyecatch'
  get 'user'              => 'user#index', as: 'user'
  root to: 'home#index'
end
