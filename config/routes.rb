Rails.application.routes.draw do
  devise_for :users
  resources :user_stocks, only: %i[ create ]

  root "welcome#index"
  get "my_portifolio", to: "users#my_portifolio"
  get "search_stock", to: "stocks#search"
end
