Rails.application.routes.draw do

  root 'users#signup'
  get 'users/signup'
  get 'users/shoppinglist'

  post "sessions/create", to: "sessions#create"
  get 'login', to: "sessions#new"
  delete "/signout", to: "sessions#destroy"

  get 'users/home'

  post "events/create", to: "events#create"

  post "expenses/create", to: "expenses#create"
  post "users/:user_id/events/:id/edit", to: "events#edit"

  post "users/:user_id/events/:id/expenses/:id/edit", to: "expenses#edit"

  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#create'

  post "users/:id/events/:id", to: "events#deactivate"
  post "users/:id/events/:id/guests/new", to: "guests#create"

  get 'report', to: "users#report"
   resources :guests , only: [ :show,:index]





  resources :users do
    resources :events do
      resources :guests do
        resources :invitations
      end
      resources :expenses , only: [ :edit, :update, :destroy,:create]

    end
  end


end
