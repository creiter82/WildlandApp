Rails.application.routes.draw do

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  
  resources :users, path: 'personnel', only: [:index, :edit, :update, :show, :destroy]

  resources :rosters
  
  resources :deployments do
    resources :images, :only => [:create, :destroy]
  end

  resources :qualifications, path: 'quals', only: [:index, :new, :create, :edit, :update, :destroy]

  root to: 'pages#home'

  resources :availabilities, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
