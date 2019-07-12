Rails.application.routes.draw do
  get '/', to: 'searches#new'
  get '/search', to: 'searches#new'
  get '/search/:page' => 'searches#show'
  post '/search/', to: 'searches#show'
end
