Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'user/registrations' }

  get 'groups/index', as: :user_root

  root "static_pages#homepage"

  resources :users do
    delete :destroy, on: :member
  end
  resources :expenses, :groups
  
end
