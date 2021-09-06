Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end
  devise_for :users
  resources :bookmarks
  root to: 'bookmarks#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    resources :users, only: %i[create]
    resources :bookmarks, only: [ :index, :show, :create, :update, :destroy ]
  end
end
