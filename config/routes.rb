Rails.application.routes.draw do
  get 'home/index'
  get 'contact/show'
  get 'about/show'
  get 'flowers/index'
  get 'flowers/show'

  root to: "home#index"

  get "/about", to: "about#show"
  get "/contact", to: "contact#show"

  get '/index', to:'home#index'
  get '/sale', to:'home#sale'
  get '/new' , to:'home#new'

  resources :flowers, only: [:index, :show] do
    collection do
      get "search"
    end
  end


  resources :home
  resources :category

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end