Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :home
  resources :customers
  resources :employees
end
