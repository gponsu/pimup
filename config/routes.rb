Rails.application.routes.draw do
  root 'pages#show', page: 'home'
  get '/pages/:page', to: 'pages#show', as: 'page'

  resources :users, only: :create

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
