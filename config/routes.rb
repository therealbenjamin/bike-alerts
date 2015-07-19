Rails.application.routes.draw do
  root 'reports#show'

  get '/reports', to: 'reports#show'

  devise_for :users
end
