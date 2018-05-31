Rails.application.routes.draw do

  devise_for :users, path: '', path_names: { sign_in: :login }, skip: [:registrations]
  as :user do
    get 'admin/edit' => 'registrations#edit', :as => 'edit_user_registration'
    put 'admin' => 'registrations#update', :as => 'user_registration'
  end

  root 'home#index'
  resources :calls, only: [:show, :index]
  resources :warranties, only: [:show, :index]
  resources :search, only: :index

  namespace :admin do
    resources :users, only: [:index, :new, :create, :destroy, :edit, :update]
    resources :warranties, except: [:show, :index]
    resources :calls, except: [:show, :index] do
      member do
        put :call_expect
        put :call_in_progress
      end
    end
    resources :boilers, except: [:show, :index] do
      resources :product_models, only: [:create, :update, :destroy], shallow: true
    end
    resources :masters, except: [:show, :index, :edit]
    resources :users, only: [:index, :show, :update, :destroy]

    get '/serial_autocomplete', to: 'calls#serial_autocomplete'
  end
end
