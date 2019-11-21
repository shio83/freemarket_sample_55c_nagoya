Rails.application.routes.draw do
  devise_for :users
  # get 'users/index'
  resources :product

  root 'tops#index'
  get  "tops/json" => "tops#json"
  
  get 'users/profile'
  get 'users/index' => "users#index" 
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

  get  'products/get_category_children' => "products#get_category_children"
  get  'products/get_category_grandchildren' => "products#get_category_grandchildren"
  get  "products/get_size" => "products#get_size"
  get  'products/details' => "products#details"
  get  'products/confirm' => "products#confirm"
  get  'products/exhibit' =>"products#exhibit"
  post 'create' => "products#create"
  get  'products/imgexhibit' =>"products#imgexhibit"
  post 'products/items' => 'products#items'

  # 本人情報の登録
  get  'identifications/index' => "identifications#index"
  post 'identifications/create' => "identifications#create"
 
  resources :signup do
    collection do
      get 'registration'
      get 'detail_tel'
      get 'detail_zip'
      get 'detail_payment'  #入力が全て完了
      get 'detail_done'  #登録完了後
    end
  end
  

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
