Rails.application.routes.draw do
  # devise_for :users, controllers: { sessions: 'api/v1/users/sessions', 
  #                                   registrations: 'api/v1/users/registrations'}
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  scope :api, defaults: { format: :json } do
    scope :v1 do
      devise_for :users, defaults: { format: :json }, path: '', path_names: {
        sign_in: 'login',
        sign_out: 'logout',
        registrations: 'signup'
      },
      controllers: {
        sessions: 'api/v1/users/sessions',
        registrations: 'api/v1/users/registrations'
      }
    end
  end

  namespace :api do
    namespace :v1 do
      resources :reservations, only: [:create]
      resources :tours
      resources :users, only: %w[show, index] do
        resources :reservations, only: %w[create index show destroy]
      end
    end
  end
  root 'api/v1/tours#index'
  resources :reservations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end

