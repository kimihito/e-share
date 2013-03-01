EShare::Application.routes.draw do
  resources :xvideos, only: :show
  resources :users, only: [:show, :create]
end
