Rails.application.routes.draw do
  root "welcome#home"
  get '/calendars/week', to: "calendars#week"
  get '/calendars/month', to: "calendars#month" 
  get '/auth/github/callback', to: 'sessions#githubAuth'
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  resources :admins
  resources :customers
  resources :users
  resources :tickets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
