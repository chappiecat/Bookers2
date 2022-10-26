Rails.application.routes.draw do
  get 'books/index'
  get 'books/show'
  get 'books/edit'
  root to: 'homes#top'
  get 'posts/index'
  devise_for :users

  get "homes/about" => "homes#about", as: "about"
 resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show, :edit, :update]
end