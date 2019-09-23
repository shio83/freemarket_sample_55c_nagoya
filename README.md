# freemarket_sample_55c_nagoya

##usersテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null:false|
|email|string|null:false, unique:true|
|password|string|null:false|

###Association
- belongs_to :profile
- has_many :comments



##profilesテーブル

|Column|Type|Option|
|------|----|------|
|text|text|
|last_name|string|null:false|
|first_name|string|null:false|
|last_name_kana|string|null:false|
|first_name_kana|string|null:false|
|prefecture|string|null:false|
|city|string|null:false|
|district|string|null:false|
|building|string|null:false|
|user_id|integer|null:false, foreign_key:true|

###Association
- belongs_to :user
- belongs_to :addres


##productsテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null:false|
|category|string|null:false|
|brand|string|null:false|
|state|string|null:false|
|postage|string|null:false|
|shipping_method|string|null:false|
|region|string|null:false|
|shipping_data|string|null:false|
|user_id|integer|null:false, foreign_key:true|
|seller_id|integer|null:false, foreign_key:true|
|buyer_id|integer|null:false, foreign_key:true|

###
- belongs_to :user
- has_many :comments

##commentsテーブル

|Column|Type|Option|
|------|----|------|
|contentext|
|user_id|integer|null:false, foreign_key:true|
|product_id|integer|null:false, foreign_key:true|

###Association
- belongs_to :user

##addresテーブル

|birth_year|string|null:false|
|birth_month|string|null:false|
|birth_day|string|null:false|
|zipcode|string|null:false|

###Association
- belongs_to :profile