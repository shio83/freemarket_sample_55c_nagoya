Rails.application.routes.draw do
  devise_for :users
  get 'users/index' 

  # 本人情報の登録
  get 'users/identification'
  # ログアウト画面
  get 'users/logout'
  # ユーザークレジットカード登録ページ
  get 'users/card'

  root 'tops#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
