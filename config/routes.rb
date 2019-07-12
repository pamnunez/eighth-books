Rails.application.routes.draw do
  get '/', to: 'searches#new'
  get '/search', to: 'searches#new'
  get '/search/:page', to: 'searches#show'
  post '/search/', to: 'searches#show'
  get '/*all', to: redirect('/search')
  get '', to: redirect('/search')
end
