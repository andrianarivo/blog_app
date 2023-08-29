Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :new, :destroy]
  end

  get 'users/:user_id/posts/:post_id/comments/new', to: 'comments#new'
  post 'users/:user_id/posts/:post_id/comments', to: 'comments#create', as: 'comments'
  post 'users/:user_id/posts/:post_id/likes', to: 'likes#create', as: 'likes'
end
