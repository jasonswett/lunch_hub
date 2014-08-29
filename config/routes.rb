LunchHub::Application.routes.draw do
  scope '/api' do
    resources :addresses
    resources :groups
    mount_devise_token_auth_for 'User', at: '/auth'
  end
end
