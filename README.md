# freemarket_sample_55c_nagoya

## usersテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null:false|
|email|string|null:false, unique:true|
|password|string|null:false|

### Association

- has_one  :profile
- has_many :comments
- has_one  :seller
- has_one  :buyer


## profilesテーブル

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

### Association

- belongs_to :user
- has_one    :addres


## productsテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null:false|
|description|text|null:false|
|state|integer|null:false|
|postage|integer|null:false|
|region|integer|null:false|
|shipping|integer|null:false|
|brand|integer|null:false|
|price|stirng|null:false|
|user_id|integer|null:false, foreign_key:true|
|seller_id|integer|null:false, foreign_key:true|
|buyer_id|integer|null:false, foreign_key:true|
|category_id|integer|null:false, foreign_key|

### Association
- belongs_to :user
- belongs_tp :category
- belongs_to :seller
- belongs_to :buyer
- has_many    :image
- has_many   :comments


## commentsテーブル

|Column|Type|Option|
|------|----|------|
|content|text|
|user_id|integer|null:false, foreign_key:true|
|product_id|integer|null:false, foreign_key:true|

### Association

- belongs_to :user
- belongs_to :products


## addresテーブル

|birth_year|string|null:false|
|birth_month|string|null:false|
|birth_day|string|null:false|
|zipcode|string|null:false|
|profile_id|integer|null:false, foreign_key:true|

### Association

- belongs_to :profile


## sellersテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null:false|
|user_id|integer|null:false|

### Association

- belongs_to :user
- has_one    :product


## buyersテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null:false|
|user_id|integer|null:false|

### Association

- belongs_to :user
- has_one    :product

## categoriesテーブル

|Column|Type|Option|
|------|----|------|
|id|integer|null:false|
|name|string|null:false|
|ancesty|integer|nullfalse|

### Association

- has_many :products


## imagesテーブル

|Column|Type|Option|
|------|----|------|
|url|string|null:false|
|product_id|integer|null:false, foreing_key:ktrue|

### Association

- has_many :products