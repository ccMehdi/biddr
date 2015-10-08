Rails.application.routes.draw do

  root "items#index"
  resources :items do
    resources :bids, only: [:create, :destroy]
  end
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
end
