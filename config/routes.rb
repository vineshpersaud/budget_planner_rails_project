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
  delete "/expense/delete", to: "expense#destroy"
  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#create'
  resources :users
  resources :events
  resources :expenses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
