Rails.application.routes.draw do

  devise_for :users

  root to: 'root#top'
  get '/top' => 'root#top'

  resources :users, only: [:show, :index, :edit, :update]

  resources :post_books, only: [:new, :create, :index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
