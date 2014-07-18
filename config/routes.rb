LunchHub::Application.routes.draw do
  scope '/api' do
    resources :addresses
    resources :groups
  end

  devise_for :users
  resources :prospective_users, only: [:new, :create]
  get '/prospective_users/thanks', to: 'prospective_users#thanks'

  root 'groups#index'
end
