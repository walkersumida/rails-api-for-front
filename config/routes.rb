Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  format = { format: 'json' }

  resources :posts, defaults: format
  resources :users, param: :uuid, defaults: format, only: %w(show update) do
    member do
      post 'profile_image', to: 'users/profile_image#create'
    end
  end
  mount_devise_token_auth_for 'User', at: 'auth', controllers: { sessions: 'sessions' }
  # TODO: root url
  # root to: 'home#index'
end
