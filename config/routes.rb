Rails.application.routes.draw do
  root "welcome#home"
  get '/today', to: "calendars#today"
  get '/calendars/week', to: "calendars#week"
  get '/calendars/month', to: "calendars#month" 
  
  get 'auth/github/callback', to: 'sessions#githubAuth'
  get 'auth/google_oauth2/callback', to: 'sessions#googleAuth'

  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  scope :admins do
    resources :users, shallow: true
  end
  get '/admins/index' => 'admins#index'
  
  resources :customers
  resources :tickets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
