Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/profile", to: "pages#profile"
  get "/add_partner", to: "users#add_partner"
  get "/end_list", to: "pages#end_list"
  resources :names, only: :index
  resources :choices, only: [ :create, :index, :update ]
  resources :filters, only: [ :new, :create, :edit, :update ]
  resources :matches, only: :index
end
