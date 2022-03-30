Rails.application.routes.draw do
  get 'home/index'
  get 'contact/show'
  get 'about/show'
  get 'flowers/index'
  get 'flowers/show'

  root to: "home#index"

  get "/about", to: "about#show"
  get "/contact", to: "contact#show"

  resources :flowers
  resources :category

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
