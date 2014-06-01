Rails.application.routes.draw do
  get 'blog/index'

  mount RedactorRails::Engine => '/redactor_rails'
  #devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  devise_for :users
  resources :posts

  root 'blog#index'

  get 'posts/index', as: 'user_root'
end
