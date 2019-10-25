Rails.application.routes.draw do
  get '/calendars/week', to: "calendars#week"
  get '/calendars/month', to: "calendars#month" 
  resources :admins
  resources :customers
  resources :users
  resources :tickets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
