Rails.application.routes.draw do
  resources :groups, only: [:index, :new, :create, :destroy] do
    resources :deals, only: [:index, :new, :create]
  end
  devise_for :users, controllers: { registrations: "custom_registrations" }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "groups#index"
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end
end
