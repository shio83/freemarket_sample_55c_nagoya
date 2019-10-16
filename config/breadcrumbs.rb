crumb :root do
  link "メルカリ", root_path
end

crumb :user do
  link "マイページ", users_index_path
end

crumb :details do
  link "ゴリラ", users_index_path
end


crumb :logout do
  link "お知らせ" , ＃
  parent :user
end

crumb :logout do
  link "やることリスト" , ＃
  parent :user
end

crumb :logout do
  link "いいね！一覧" , ＃
  parent :user
end

crumb :logout do
  link "出品する" , ＃
  parent :user
end

crumb :logout do
  link "出品した商品-出品中" , ＃
  parent :user
end

crumb :logout do
  link "出品した商品-取引中" , ＃
  parent :user
end

crumb :logout do
  link "出品した商品-売却済" , ＃
  parent :user
end

crumb :logout do
  link "購入した商品-取引中" , ＃
  parent :user
end

crumb :logout do
  link "購入した商品-過去の取引" , ＃
  parent :user
end

crumb :logout do
  link "ニュース一覧" , ＃
  parent :user
end

crumb :logout do
  link "評価一覧" , ＃
  parent :user
end

crumb :logout do
  link "ガイド" , ＃
  parent :user
end

crumb :logout do
  link "お問い合わせ" , ＃
  parent :user
end

crumb :logout do
  link "売り上げ・振込申請" , ＃
  parent :user
end

crumb :logout do
  link "ポイント" , ＃
  parent :user
end

crumb :profile do 
  link "プロフィール", users_profile_path
  parent :user
end

crumb :logout do
  link "発送元・お届け先住所変更" , ＃
  parent :user
end

crumb :card do
  link "お支払い方法" , users_card_path
  parent :user
end

crumb :logout do
  link "メール/パスワード" , ＃
  parent :user
end

crumb :identification do
  link "本人情報" , users_identification_path
  parent :user
end

crumb :logout do
  link "電話番号の確認" , ＃
  parent :user
end

crumb :logout do
  link "ログアウト" , users_logout_path
  parent :user
end


