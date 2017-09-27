Rails.application.routes.draw do

  resources :posts do
  	resources :comments, only: [:create]
  end

  get 'comments/create'

  root 'posts#index'

end
