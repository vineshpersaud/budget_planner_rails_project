Rails.application.routes.draw do
  root 'users#signup'
  get 'users/signup'
  get 'users/login'
  get 'users/home'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
