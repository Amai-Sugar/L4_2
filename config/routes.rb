Rails.application.routes.draw do
  get 'top/main'
  post 'top/login'
  post 'top/login_check'
  get 'top/error'
  get 'top/logout'
  root 'top#main'
end
