Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => 'registrations'}

  root to: "home#index"
  resources :orders, only: [:show, :index]
  resources :guarantees, only: [:show, :index]


  namespace :admin do
    resources :guarantees, except: [:show, :index]
    resources :orders, except: [:show, :index]
    resources :models
    resources :massters
    resources :users
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
