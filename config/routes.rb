Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions', passwords: 'users/passwords'}
  root to: 'users#index'

  devise_scope :user do 
    get '/users/sign_out', to: 'users/sessions#destroy'
  end

  resources :posts, only: [:new, :create]
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :destroy] do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show] do
        resources :posts, only: [:index, :show] do
          resources :comments, only: [:index, :show]
        end
      end
    end
  end
end
