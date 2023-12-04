Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root "home#index"

  resource :shopping_cart, only: [:show] do
    post 'add_item/:handcrafted_item_id', action: :add_item, on: :member, as: :add_item
    delete 'remove_item/:id', action: :remove_item, on: :member, as: :remove_item
  end

  resources :checkout, as: :orders

  resources :artisans, as: :users do
    resources :handcrafted_items
  end
end
