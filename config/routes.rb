Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  get 'blog/index'

  #devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  devise_for :users
  resources :posts
  match '/404', :to => 'errors#not_found', :via => [:get]
  match '/500', :to => 'errors#internal_error', :via => [:get]
  match '/422', :to => 'errors#unprocessable_entity', :via => [:get]

  root 'blog#index'

  get 'posts/index', as: 'user_root'
end
