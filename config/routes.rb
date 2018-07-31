Rails.application.routes.draw do
  get 'profiles/show', to: 'profiles#show', as: :profile
  devise_for :users
  root 'home#index'
  resources :home
  resources :customers
  resources :employees
end
