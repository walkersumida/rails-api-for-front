Rails.application.routes.draw do
  resources :posts
  mount_devise_token_auth_for 'User', at: 'auth'
  # TODO: root url
  # root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
