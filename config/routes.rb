Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [ :show ] do
    resources :comments, only: [ :create ]
  end

  resources :products do
    resources :offers, only: [ :create, :edit, :update, :destroy ]
  end

  get '/offer/:id/accept', to: "offers#accept", as: "accept_offer"
  get '/offer/:id/decline', to: "offers#decline", as: "decline_offer"
end
