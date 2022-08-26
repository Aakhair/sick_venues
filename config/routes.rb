Rails.application.routes.draw do
  devise_for :users
  root to: "pages#landing_page"

  get "/venues", to: "venues#index"
  get "/my_venues", to: "venues#my_venues"
  get "/my_reservations", to: "reservations#my_reservations"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :venues, only: %i[index show new create edit update] do
    resources :reservations, only: %i[new create]
  end
end
