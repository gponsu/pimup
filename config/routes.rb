Rails.application.routes.draw do
  root 'pages#show', page: 'home'
  get '/pages/:page', to: 'pages#show', as: 'page'

  resources :users, only: :create

  resources :registrations, path: :users
  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
