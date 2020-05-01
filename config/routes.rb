Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'statistics', to: 'items#statistics', as: 'statistics'
  # get 'users/:id/items' => 'items#index', :as => :user_items_path
  resources :items, only: [:index, :new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
