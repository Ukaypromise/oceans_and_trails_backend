Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :tours
      resources :users do
        resources :reservations
      end
    end
  end

  resources :tours
 
  resources :users do
    resources :reservations
  end
  root 'tours#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end

