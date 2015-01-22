LunchHub::Application.routes.draw do
  scope '/api' do
    resources :addresses
    resources :groups
    resources :announcements
    mount_devise_token_auth_for 'User', at: 'auth'
  end
end
