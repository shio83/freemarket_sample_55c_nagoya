Rails.application.routes.draw do
  devise_for :users
  # get 'users/index'

  get 'users/profile'
  get 'users/index' => "users#index" 
  get 'items/details' => "items#details"
  

  # 本人情報の登録
  get 'users/identification' => "users#identification"
  # ログアウト画面
  get 'users/logout' => "users#logout"
  # ユーザークレジットカード登録ページ
  get 'users/card' => "users#card"

  root 'tops#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
