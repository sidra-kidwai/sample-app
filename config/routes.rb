Rails.application.routes.draw do
  root to: 'posts#index'
  get 'attachments/:id', to: 'attachments#show', defaults: { format: 'jpg' }, constraints: { subdomain: 'admin' }


  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments
  end
end
