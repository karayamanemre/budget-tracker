Rails.application.routes.draw do
  devise_for :users

  get 'groups/index', as: :user_root

  root "static_pages#homepage"

  resources :users, :proceedings, :groups
end
