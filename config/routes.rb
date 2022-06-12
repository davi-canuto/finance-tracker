Rails.application.routes.draw do
  devise_for :users
  root "welcome#index"

  get  "my_portifolio", to: 'users#my_portifolio'
end
