LunchHub::Application.routes.draw do
  resources :addresses

  resources :groups

  devise_for :users
  resources :prospective_users, only: [:new, :create]
  get '/prospective_users/thanks', to: 'prospective_users#thanks'

  # You can have the root of your site routed with "root"
  root 'prospective_users#new'
end
