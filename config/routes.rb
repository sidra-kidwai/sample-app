Rails.application.routes.draw do
  get 'comments/index'
  get 'comments/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :posts do
    resources :comments
  end
end
