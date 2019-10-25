Rails.application.routes.draw do
  get '/calendars/week', to: "calendars#week"
  get '/calendars/month', to: "calendars#month" 
  get '/auth/:provider/callback', to: 'sessions#githubAuth'
  get '/login', to: 'sessions#create'
  post '/login', to: 'session#create'
  get '/logout', to: 'session#delete'
  resources :admins
  resources :customers
  resources :users
  resources :tickets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
