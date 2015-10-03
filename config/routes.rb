Rails.application.routes.draw do

  devise_for :users
  root to: 'welcome#index'

  get 'welcome/about'
  
  resources :registered_applications
  
  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#index', via: [:options]
    resources :events, only: [:create]
  end
end
