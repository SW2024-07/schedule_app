Rails.application.routes.draw do
  get 'top/main'
  get 'top/login'
  get 'top/logout'
  get 'login', to: 'top#login'
  post 'login', to: 'top#login'
  get 'top/logout', to: 'top#logout', as: 'logout'

  root 'top#main'

  resources :comments, only: [:index, :new, :create, :destroy]
  #root 'comments#index'


  # config/routes.rb
  get 'search', to: 'search#show', as: 'search'

  
  get 'mypage', to: 'users#show', as: :mypage
  
  resources :users, only: [:new, :create, :show] # 新規登録とマイページ
  resources :user_calendars
  resources :user_calendars do
    resources :events
  end

end
