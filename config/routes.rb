Rails.application.routes.draw do
  root 'pages#show', page: 'home'
  get '/pages/:page', to: 'pages#show', as: 'page'

  resources :registrations, only: :create

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
