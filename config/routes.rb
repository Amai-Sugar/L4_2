Rails.application.routes.draw do
  get 'top/main'
  post 'top/login'
  post 'top/login_check'
  get 'top/error'
  get 'top/logout'
  get 'top/new'
  post 'top/create' => 'top/create'
  resources :register
  root 'top#main'
end
