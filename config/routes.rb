Rails.application.routes.draw do
  get 'blog/index'

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  resources :posts

  root 'blog#index'

  get 'posts/index', as: 'user_root'
end
