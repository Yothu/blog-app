Rails.application.routes.draw do
  root to: 'users#index', as: 'users'

  # get '/users/', to: 'users#index', as: 'users'
  get '/users/:id', to: 'users#show', as: 'user'

  get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get '/posts/new', to: 'posts#new', as: 'new_post'
  get '/users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'

  post '/posts', to: 'posts#create'
  post '/users/:user_id/posts/:id/comments', to: 'comments#create'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
