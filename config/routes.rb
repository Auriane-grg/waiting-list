Rails.application.routes.draw do

  root to: 'waiting_users#new'

  get 'pages/queue_position'
  resources :waiting_users, only: [:create, :new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
