RailsProject::Application.routes.draw do

  get "logout" => 'sessions#destroy', as:"logout"
  get "login" => 'sessions#new', as:"login"
  get "signup" => 'users#new', as:"signup"

  root :to => 'static_pages#index'

  resources :sessions
  resources :users do
    member do
      get :activate
    end
  end

  resources :albums do
    resources :pictures
  end
end
