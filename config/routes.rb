Rails.application.routes.draw do

  devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations'
}

  root "home#index"

  resources :products

  resources :artisans, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :handcrafted_items
  end

end
