Rails.application.routes.draw do
 
  root 'users#signup'
  get 'users/signup'
  get 'users/shoppinglist'

  post "sessions/create", to: "sessions#create"
  get 'login', to: "sessions#new"
  delete "/signout", to: "sessions#destroy"
  
  get 'users/home'

  post "expenses/create", to: "expenses#create"
  delete "/expense/delete", to: "expense#destroy"

  post "events/create", to: "events#create"
  
  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#create'



  resources :expenses

  resources :users do
    resources :events
  end

  
end
