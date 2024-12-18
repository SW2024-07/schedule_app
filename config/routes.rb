Rails.application.routes.draw do
  resources :blogs
  get 'blogs/index'
  get 'top/main'
  get 'top/login'
  get 'top/logout'
  #root 'top#main' # トップページ
  get 'login', to: 'top#login'
  post 'login', to: 'top#login'
  get 'top/logout', to: 'top#logout', as: 'logout'
  root 'top#main'
  get 'search', to: 'search#search', as: 'search'
 #asd
  resources :users, only: [:new, :create, :show] # 新規登録とマイページ
end
