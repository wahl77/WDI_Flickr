RailsProject::Application.routes.draw do
  root :to => 'static_pages#index'
  resources :albums do
    resources :pictures
  end
end
