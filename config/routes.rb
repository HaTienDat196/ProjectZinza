Rails.application.routes.draw do
  devise_for :views
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :line_items
  resources :carts
  devise_for :users

  namespace :admin do
    resources :products
    resources :categories
    resources :users
  end
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end
    resources :people do
    collection do
      match 'search' => 'people#search', :via => [:get, :post], :as => :search
    end
  end
  resources :products, concerns: :paginatable
  get "/admin", to: "admin#index"
  scope "(:locale)", locale: /en|vi/ do
  root to: 'products#index'
  end
end
