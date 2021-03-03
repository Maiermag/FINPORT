Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/portfolio_import", to: 'pages#portfolio_import', as: :portfolio_import
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :portfolios, only: [:index, :show, :destroy, :new]
end

