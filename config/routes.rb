RailsProject::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get "logout" => 'sessions#destroy', as:"logout"
  get "login" => 'sessions#new', as:"login"
  get "signup" => 'users#new', as:"signup"

  post "transaction" => 'transaction#create', as:"transaction"

  root :to => 'static_pages#index'

  resources :sessions
  resources :users do
    member do
      get :activate
    end
  end

  resources :passwordresets

  resources :albums do
    resources :pictures
  end
end
