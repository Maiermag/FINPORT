Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/portfolio_import", to: 'pages#portfolio_import', as: :portfolio_import
  get "/dashboard", to: 'pages#dashboard', as: :dashboard
  get "/frontend_test", to: 'pages#frontend_test', as: :frontend_test
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :portfolios, only: [:index, :show, :destroy, :new, :create]
  resources :institutions, only: [:index]


  get "/testcomponents", to: 'pages#testcomponents'

  get "/chart_playground", to: 'pages#chart_playground', as: :chart_playground

end

