Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => 'registrations'}

  root to: "home#index"
  resources :calls, only: [:show, :index]
  resources :warranties, only: [:show, :index]


  namespace :admin do
    resources :warranties, except: [:show, :index]
    resources :calls, except: [:show, :index]
    resources :boilers
    resources :masters
    resources :users
    resources :product_models
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
