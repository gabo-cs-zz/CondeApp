Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :home
  # delete 'customers/:id', to: 'customers#delete', as: :delete_customer
  resources :customers
  # delete 'employees/:id', to: 'employees#delete', as: :delete_employee
  resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
