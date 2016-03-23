Rails.application.routes.draw do
  devise_for :users
  resources :articles
  resources :tags
  resources :authors

  root "articles#index"

end
