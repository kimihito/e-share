EShare::Application.routes.draw do
  resources :watch_histories, only: [:create, :destroy]
  resources :users, only: [:show, :create]
end
