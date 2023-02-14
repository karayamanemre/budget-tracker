Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'user/registrations' }

  get 'groups/index', as: :user_root

  root "static_pages#homepage"

  resources :users, :expenses, :groups
  
end
