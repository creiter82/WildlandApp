Rails.application.routes.draw do

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :users, path: 'personnel', only: [:edit, :update, :show, :destroy]
  resources :users, path: 'personnels', only: [:index]

  resources :rosters

  resources :certifications, only: [:index, :new, :create, :edit, :update, :destroy]

  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
