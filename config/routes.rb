Rails.application.routes.draw do

  root to: 'waiting_users#new'

  get 'pages/queue_position'
  get 'pages/first_inscription'
  get 'pages/cancel_inscription'

  resources :waiting_users, only: [:create, :new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
