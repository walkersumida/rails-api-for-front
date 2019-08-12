Rails.application.routes.draw do
  format = { format: 'json' }

  resources :posts, defaults: format
  resources :users, defaults: format, only: %w(show update)
  mount_devise_token_auth_for 'User', at: 'auth', controllers: { sessions: 'sessions' }
  # TODO: root url
  # root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
