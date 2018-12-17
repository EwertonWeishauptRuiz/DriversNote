Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show], path: "/" do
    resources :orders do
      match :confirm_address, via:[:get, :post]
      get :confirm_order
      get :order_completion
      get :add_address
      get :choose_address
    end
    
    resources :addresses    
  end
  root to: "orders#new"
end
