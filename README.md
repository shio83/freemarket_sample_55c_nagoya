# freemarket_sample_55c_nagoya

## usersテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null:false|
|email|string|null:false, unique:true|
|password|string|null:false|

### Association

- has_many :comments, dependent: :destroy
- has_many :products, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :seller_buyers, dependent: :destroy
- has_one :credit_card, dependent: :destroy
- has_one :profile, dependent: :destroy

## profilesテーブル

|Column|Type|Option|
|------|----|------|
|text|text|
|last_name|string|null:false|
|first_name|string|null:false|
|last_name_kana|string|null:false|
|first_name_kana|string|null:false|
|birth_year|string|null:false|
|birth_month|string|null:false|
|birth_day|string|null:false|
|zipcode|string|null:false|
|prefecture|string|null:false|
|city|string|null:false|
|district|string|null:false| 
|building|string|null:false|
|phone_number|string|unique:true|
|user_id|integer|null:false, index:true,foreign_key:true|

### Association

- belongs_to :user

## credit_cardsテーブル

|Column|Type|Option|
|------|----|------|
|authorization_token|string|null:false, unique: true|
|security_code|string|null: false|
|month|integer|null: false|
|year|integer|null: false
|user_id|integer|null:false, index: true, foreign_key: true

### Association

- belongs_to :user

## productsテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null:false|
|description|text|null:false|
|state|integer|null:false|
|shipping_fee|integer|null:false|
|shipping_region|intger|null:false|
|shipping_date|integer|null:false|
|price|stirng|null:false|
|size|integer|null:false|
|user_id|integer|null:false, foreign_key:true|
|category_id|integer|null:false, foreign_key|
|brand_id|integer|null:false, foreign_key|

### Association

- belongs_to :brand
- belongs_to :user
- belongs_to :category
- has_many   :images
- has_many   :comments
- has_many   :likes

## commentsテーブル

|Column|Type|Option|
|------|----|------|
|text|text|
|user_id|integer|null:false, foreign_key:true, index: true|
|product_id|integer|null:false, foreign_key:true, index: true|

### Association

- belongs_to :user
- belongs_to :product


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

- belongs_to :product

## likesテーブル

|Column|Type|Option|
|------|----|------|
|user_id|integer|null:false, foreign_key, index: true|
|product_id|integer|null:false, foreign_key, index: true|

### Association

- belongs_to :user
- belongs_to :product

## brandsテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null:false, unique:true|

### Association

- has_many :products

## seller_buyerテーブル

|Column|Type|Option|
|------|----|------|
|buyer_id|integer|null: false, index: true, foreign_key: { to_table: :users }|
|seller_id|integer|null: false, index: true, foreign_key: { to_table: :users }|

### Association

- belongs_to :buyer_id, class_name: "User"
- belongs_to :seller_id, class_name: "User"
