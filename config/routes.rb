Rails.application.routes.draw do
  resources :calendars
  resources :admins
  resources :customers
  resources :users
  resources :tickets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
