Rails.application.routes.draw do
  get 'event/new'
  get 'event/edit'
  root 'users#signup'
  get 'users/signup'
  get 'login', to: "sessions#new"
  get 'users/home'
  post "sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
