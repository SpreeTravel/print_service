Rails.application.routes.draw do
  resources :line_items
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :organizations do
    resources :invoices
    resources :customers
  end

  resources :invoices do
    resources :line_items
  end

end
