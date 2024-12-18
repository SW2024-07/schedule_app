Rails.application.routes.draw do
  get 'top/main'
  get 'top/login'
  get 'top/logout'
  get 'login', to: 'top#login'
  post 'login', to: 'top#login'
  get 'top/logout', to: 'top#logout', as: 'logout'
  root 'top#main'
<<<<<<< HEAD
  get 'search', to: 'search#search', as: 'search'
 #asd
=======
  
  get 'mypage', to: 'users#show', as: :mypage
  
>>>>>>> origin/main
  resources :users, only: [:new, :create, :show] # 新規登録とマイページ
  resources :user_calendars
end
