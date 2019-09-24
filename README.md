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
|addres_id|string|null:false, foreign_key:true|

### Association

- belongs_to :user
- belongs_to :addres


## productsテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null:false|
|category_id|integer|null:false, foreign_key:true|
|brand_id|integer|null:false, foreign_key:true|
|state_id|integer|null:false, foreign_key:true|
|postage_id|integer|null:false, foreign_key:true|
|shipping_id|integer|null:false, foreign_key:true|
|region_id|integer|null:false, foreign_key:true|
|user_id|integer|null:false, foreign_key:true|
|seller_id|integer|null:false, foreign_key:true|
|buyer_id|integer|null:false, foreign_key:true|

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- belongs_to :state
- belongs_to :postage
- belongs_to :shipping
- belongs_to :region
- belongs_to :seller
- belongs_to :buyer
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

### Association

- has_one :profile


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


## categorysテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null:false|

### Association

- has_one :product


## brandsテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null:false|

### Association

- has_one :product


## statesテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null:false|

### Association

- has_one :product


## postagesテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null:false|

### Association

- has_one :product


## shippingsテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null:false|
|date|string|null:false|

### Association

- has_one :product


## regionsテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null:false|

### Association

- has_one :product