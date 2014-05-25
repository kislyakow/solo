Rails.application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'
  devise_for :users
  resources :posts

  root 'posts#index'

  get 'posts/index', as: 'user_root'
end
