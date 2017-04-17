Rails.application.routes.draw do
  devise_for :users, :path_prefix => 'd' # routes for devise modules on User
  resources :users # custom admin-type CRUD for users
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'product/index'
  get 'product/show'
  get 'welcome/index'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
