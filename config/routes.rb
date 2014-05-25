Rails.application.routes.draw do
  devise_for :users
  resources :posts

  root 'posts#index'

  get 'posts/index', as: 'user_root'
end
