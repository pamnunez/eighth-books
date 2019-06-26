Rails.application.routes.draw do
  get '/', to: 'searches#new'
  get '/search', to: 'searches#new'
  post '/search', to: 'searches#show'
end
