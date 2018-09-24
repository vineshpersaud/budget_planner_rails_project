Rails.application.routes.draw do
  get 'events/new'
  get 'events/edit'
  root 'users#signup'
  get 'users/signup'
  get 'users/shoppinglist'
  get 'login', to: "sessions#new"
  get 'users/home'
  post "sessions/create", to: "sessions#create"
  post "events/create", to: "events#create"
  post "expenses/create", to: "expenses#create"
  delete "/signout", to: "sessions#destroy"
  delete "/event/delete", to: "event#destroy"
  resources :users
  resources :events
  resources :expenses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
