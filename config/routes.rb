EMS::Application.routes.draw do

  root 'site#index'

  get 'register' => 'members#new'
  post 'register' => 'members#create'

  get 'login' => 'session#new'
  post 'login'=> 'session#create'
  delete 'logout' => 'session#destroy'
  get 'logout' => 'session#destroy'

  get 'privacy' => 'site#privacy'
  get 'terms'=> 'site#terms'

  get 'reset/:code' => 'password#edit', as: :reset
  put 'reset/:code' => 'password#update'
  patch 'reset/:code' => 'password#update'

  get 'squad' => 'members#index'

  # get 'squad/:user_id' => 'members#select'
  # put 'squad/edit/:user_id' => 'members#update'
  # patch 'squad/edit/:user_id' => 'members#update'
  # delete 'squad/:user_id' => 'members#destroy'


 
end
