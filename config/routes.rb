Rails.application.routes.draw do
  get 'order_items/create'
  get 'order_items/update'
  get 'order_items/destroy'
  get 'carts/show'
  get 'contact/contact_us'
  get 'about/about_us'

  devise_for :users, :path_prefix => 'd' # routes for devise modules on User
  resources  :users # custom admin-type CRUD for users

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'product/index'
  get 'product/show'
  # get 'welcome/index'

  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources 'product', only: [:index, :show, :acoustic_category]

  # Define the domain root
  root 'product#index'

  # Routes for the pages that show products according their category
  get 'products_acoustic' => 'product#acoustic_category',  as: 'acoustic_products'
  get 'products_electric' => 'product#electric_category',  as: 'electric_products'
  get 'products_bass'     => 'product#bass_category',      as: 'bass_products'
  get 'products_amps'     => 'product#amps_category',      as: 'amps_products'
  get 'products_acessory' => 'product#acessory_category',  as: 'acessory_products'
  get 'products_other'    => 'product#other_category',     as: 'other_products'

  # Routes for the pages that show products with the 'status' attribute equal to 'sale' and 'new'
  get 'products_sale' => 'product#sale_products',  as: 'sale_products'
  get 'products_new' => 'product#new_products',  as: 'new_products'

  # Routes for the 'about' and 'contact' pages
  resources 'about', only:[:about_us]
  resources 'contact', only:[:contact_us]

  # Route to the single keyword search
  get 'search_results' => 'product#search_results', as: 'search_results'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
