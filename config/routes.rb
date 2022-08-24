Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "/landing-page", to: "pages#landing_page"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :venues, only: %i[index show new create edit update] do
    resources :reservations, only: %i[new create]
  end
end
