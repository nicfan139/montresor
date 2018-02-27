Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [ :show ]

  resources :products do
    resources :offers, only: [ :create, :edit, :update, :destroy ]
  end

  get '/offer/:id/accept', to: "offers#accept", as: "accept_offer"
  get '/offer/:id/decline', to: "offers#decline", as: "decline_offer"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
