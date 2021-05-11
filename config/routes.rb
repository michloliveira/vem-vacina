Rails.application.routes.draw do
  get 'entrar', to:'sessions#new'
  post 'entrar', to: 'sessions#create'
  delete 'sair', to: 'sessions#destroy'

  resources :enderecos, only: [:new, :create]
  resources :vacinas
  resources :usuarios
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
