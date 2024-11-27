Rails.application.routes.draw do
  get 'top/main'
  get 'top/login'
  get 'top/logout'
  root 'top#main' # トップページ
  get 'login', to: 'top#login'
  post 'login', to: 'top#login'
  delete 'logout', to: 'top#logout'

  resources :users, only: [:new, :create, :show] # 新規登録とマイページ
  resources :calendars # 他のリソースも必要に応じて追加
end
