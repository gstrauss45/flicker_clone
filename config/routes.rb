Rails.application.routes.draw do
  devise_for :users
  root 'application#index'
  post 'add_tag', to: 'tags#add_tag'
  post 'edit_tag', to: 'tags#edit_tag'
  get 'edit_tag', to: 'tags#edit'
  get 'favourite', to: 'users#favourite'
  resources :images
  resources :tags
  resources :users
  resources :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
