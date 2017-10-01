Rails.application.routes.draw do


  devise_for :users, controllers: {
    registrations: 'users/resistrations'
  }

  resources :posts do
    resources :comments, only: [:create]
  end


  get 'comments/create'

  root 'posts#index'

end
