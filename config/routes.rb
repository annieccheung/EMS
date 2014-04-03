EMS::Application.routes.draw do

  resources :users
  resources :pcrs

  root 'site#index'

  get 'login' => 'session#new'
  post 'login'=> 'session#create'
  delete 'logout' => 'session#destroy'
  get 'logout' => 'session#destroy'

  get 'privacy' => 'site#privacy'
  get 'terms'=> 'site#terms'

  get 'reset/:code' => 'password#edit', as: :reset
  put 'reset/:code' => 'password#update'
  patch 'reset/:code' => 'password#update'

  # get 'squad' => 'members#index'

  # get 'register' => 'members#new'
  # post 'register' => 'members#create'

  # get 'members/:user_id' => 'members#show', as: :member

  # get 'pcr' => 'pcr#index'

  # get 'pcr' => 'pcr#new'
  # post 'pcr' => 'pcr#create'


  # put 'squad/edit/:user_id' => 'members#update'
  # patch 'squad/edit/:user_id' => 'members#update'
  # delete 'squad/:user_id' => 'members#destroy'


  # resources :user do
  #   get :avatar, on: :member
  # end
 
end
