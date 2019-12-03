Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    # sessions: 'users/sessions',
    # registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # devise_for :admins, :class_name => 'User'
  
  # get 'users/index'
  # resources :product

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
   # 出品した商品
   get 'users/sell_will' => "users#sell_will"
   get 'users/sell_now' => "users#sell_now"
   get 'users/sell_was' => "users#sell_was"
   get 'products/:id/sell_detail' => "products#sell_detail"


   # 購入した商品-取引中ページ
   get 'users/purchase' => "users#purchase"
   # 購入した商品-過去の取引ページ
   get 'users/purchased' => "users#purchased"

  get  'products/:id/edit' => 'products#edit'
  patch "products/:id/update" => "products#update"
  patch "products/:id/buy" => "products#buy"
  get  'products/:id/details' => "products#details" 
  get  'products/get_category_children' => "products#get_category_children"
  get  'products/get_category_grandchildren' => "products#get_category_grandchildren"
  get  "products/get_size" => "products#get_size"
  get  'products/:id/confirm' => "products#confirm"
  get  'products/exhibit' =>"products#exhibit"
  get  'products/sell_modal' =>"products/sell_modal"
  post 'create' => "products#create"
  get  'products/imgexhibit' =>"products#imgexhibit"
  post 'items' => 'products#items'
  delete "products/:id/destroy" => "products#destroy"
  # 本人情報の登録
  get  'identifications/index' => "identifications#index"
  post 'identifications/create' => "identifications#create"
  
  # resources :products do
  #   collection do
  #     get "get_category_children"
  #     get "get_category_grandchildren"
  #     get "get_size"
  #     get "confirm"
  #     get "imgexhibit"
  #   end
  #   member do
  #     get "details"
  #     get "exhibit"  
  #   end
  # end

  resources :signup do
    collection do
      get 'registration'
      get 'detail_tel'
      get 'sns'
      get 'detail_zip'
      get 'detail_payment'  #入力が全て完了
      get 'detail_done'  #登録完了後
    end
  end


  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
