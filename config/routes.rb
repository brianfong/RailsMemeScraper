Rails.application.routes.draw do

  # get 'carousel/new'
  # get 'carousel/create'

  #resources :memes, only: [:index]
  root to: 'memes#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
