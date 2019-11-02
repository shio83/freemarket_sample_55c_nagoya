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
  # post 'products/create' => "products#create"
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

  # 本人情報の新規登録
  get 'users/registration' => "users#registration"
  # 本人情報の新規登録_メールアドレス
  get 'users/detail_confirmation' => "users#detail_confirmation"

  root 'tops#index'

  post "users/:parent_id/create" => "users#create"
  get "tops/json" => "tops#json"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
