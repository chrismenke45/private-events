Rails.application.routes.draw do
  resources :events
  resources :enrollments, only: [:create, :destroy]
  devise_for :users, controllers: {
                       sessions: "users/sessions",
                       registrations: "users/registrations",
                     }
  get "/users/:id", to: "users#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "events#index"
  # root "articles#index"
end
