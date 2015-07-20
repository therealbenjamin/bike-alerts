Rails.application.routes.draw do
  root 'reports#show'

  get '/reports', to: 'reports#show'
  post '/reports', to: 'reports#create'
end
