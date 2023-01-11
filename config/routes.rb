Rails.application.routes.draw do
  # devise_for :users, controllers: { sessions: 'api/v1/users/sessions', 
  #                                   registrations: 'api/v1/users/registrations'}
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  #  namespace :api do
  #   namespace :v1 do
      devise_for :users, path: '', path_names: {
        sign_in: 'login',
        sign_out: 'logout',
        sign_up: 'signup'
        }, controllers: { sessions: 'users/sessions',
         registrations: 'users/registrations' }  
      end
    end

  # namespace :api do
  #   namespace :v1 do
  #   devise_for :users, path: '', path_names: {
  #     sign_in: 'login',
  #     sign_out: 'logout',
  #     registration: 'signup'
  #     },
  #     controllers: {
  #     sessions: 'api/v1/users/sessions',
  #     registrations: 'api/v1/users/registrations'
  #     } 
  #   end
  # end

  namespace :api do
    namespace :v1 do
      resources :tours
      resources :reservations
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

