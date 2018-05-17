Rails.application.routes.draw do

  devise_for :users

  root to: 'root#top'
  get '/top' => 'root#top'
  get '/about' => 'root#about', as: 'about'

  resources :users, only: [:show, :index, :edit, :update]

  resources :post_books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
  	resource :favorites, only: [:create, :destroy]
  	resource :post_comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
