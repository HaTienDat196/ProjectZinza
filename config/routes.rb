Rails.application.routes.draw do
  resources :orders
  devise_for :views
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :line_items
  resources :carts
  devise_for :users
  resources :users

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end
    resources :people do
    collection do
      match 'search' => 'people#search', :via => [:get, :post], :as => :search
    end
  end
  resources :products, concerns: :paginatable
  get 'user/profile', to: 'users#profile', as: 'profile'
  get 'user/get_user_bought_your_product', to: 'users#get_users_bought_your_product', as: 'get_user_bought_your_product'
  get "user/index", to: "users#index"
  get "/admin", to: "admin#index"
  get "/danghang", to: "products#danghang"
  get "quanlihang", to: "products#quanlihang"
  get "products", to: "products#index"
  scope "(:locale)", locale: /en|vi/ do
  root to: 'products#index'
  end
end
