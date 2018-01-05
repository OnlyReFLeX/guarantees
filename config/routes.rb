Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => 'registrations'}

  root to: "home#index"
  resources :calls, only: [:show, :index]
  resources :warranties, only: [:show, :index]


  namespace :admin do
    resources :warranties, except: [:show, :index]
    resources :calls, except: [:show, :index, ]
    resources :boilers, except: [:show, :index, :edit]
    resources :masters, except: [:show, :index, :edit]
    resources :users, only: [:index, :show, :update, :destroy]
    resources :product_models, only: [:create, :update, :destroy]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
