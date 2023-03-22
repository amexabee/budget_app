Rails.application.routes.draw do
  resources :categories, only: [:index, :new, :createx]
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#intro"
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end
end
