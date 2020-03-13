Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root to: 'items#index'

  resources :items, only: [:index, :new, :create, :edit, :update]
  resources :users, only: :show
  
    # do
    # resources :cards, only: [:new, :show] do
    #   collection do
    #     post 'show', to: 'card#show'
    #   end
    # end
  # end

end
