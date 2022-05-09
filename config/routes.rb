Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions', passwords: 'users/passwords'}
  root to: 'users#index', as: 'users'

  devise_scope :user do 
    get '/users/sign_out', to: 'users/sessions#destroy'
  end
  get '/users/:id', to: 'users#show', as: 'user'

  get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get '/posts/new', to: 'posts#new', as: 'new_post'
  get '/users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'

  post '/posts', to: 'posts#create'
  post '/users/:user_id/posts/:id/comments', to: 'comments#create'
  post '/users/:user_id/posts/:id/likes', to: 'likes#create'
end
