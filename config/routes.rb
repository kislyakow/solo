Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  get 'blog/index'
  get 'posts/index', as: 'user_root'
  match '/404', :to => 'errors#not_found', :via => [:get]
  match '/500', :to => 'errors#internal_error', :via => [:get]
  match '/422', :to => 'errors#unprocessable_entity', :via => [:get]
  mount Ckeditor::Engine => '/ckeditor'  
  resources :posts do
    resources :comments
  end
  root 'blog#index'  
end