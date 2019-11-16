Rails.application.routes.draw do
  devise_for :users
  # get 'users/index'
  resources :product
  get 'products/get_category_children' => "products#get_category_children"
  get 'products/get_category_grandchildren' => "products#get_category_grandchildren"
  get "products/get_size" => "products#get_size"
  get 'users/profile'
  get 'users/index' => "users#index" 

  get 'products/details' => "products#details"
  get 'products/confirm' => "products#confirm"
  get 'products/exhibit' =>"products#exhibit"
  post 'products/create' => "products#create"
  get 'products/imgexhibit' =>"products#imgexhibit"
  post 'products/items' => 'products#items'
  # 本人情報の登録
  get 'identifications/index' => "identifications#index"
  post 'identifications/create' => "identifications#create"
  # ログアウト画面
  get 'users/logout' => "users#logout"
  # ユーザークレジットカード登録ページ
  get 'users/card' => "users#card"
  # お知らせページ
  get 'users/notification' => "users#notification"
  # やることリストページ
  get 'users/todo' => "users#todo"
  # 購入した商品-取引中ページ
  get 'users/purchase' => "users#purchase"
  # 購入した商品-過去の取引ページ
  get 'users/purchased' => "users#purchased"

  resources :signup do
    collection do
      get 'registration'
      get 'detail_tel'
      get 'detail_zip'
      get 'detail_payment'  #入力が全て完了
      get 'detail_done'  #登録完了後
    end
  end
  # 本人情報の新規登録
  get 'users/registration' => "users#registration"
  post 'users/registration' => "users#create" ,as: 'users_create'
  # 本人情報の新規登録_メールアドレス_tel
  get 'users/detail_tel' => "users#detail_tel"
  # 本人情報の新規登録_メールアドレス_zip
  get 'users/detail_zip' => "users#detail_zip"
  # 本人情報の新規登録_メールアドレス_payment
  get 'users/detail_payment' => "users#detail_payment"
  # 本人情報の新規登録_メールアドレス_done
  get 'users/detail_done' => "users#detail_done"
  
  root 'tops#index'
  # post "users/:parent_id/create" => "users#create"
  get "tops/json" => "tops#json"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
