Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: :show do
    member do
      get :order_beacons
      post :add_beacons_to_order
    end
  end
end