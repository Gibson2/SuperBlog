Rails.application.routes.draw do


  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :posts do
    resources :comments, only: [:create]
  end

  resources :users

  get 'comments/create'

  root 'posts#index'

end
