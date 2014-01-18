LunchHub::Application.routes.draw do
  resources :addresses

  resources :groups

  devise_for :users

  resources :prospective_users, only: [:new, :create] do
    collection do
      get 'thanks'
    end
  end

  get 'get_notified' => 'prospective_users#new', as: :get_notified

  # You can have the root of your site routed with "root"
  root 'groups#index'
end
