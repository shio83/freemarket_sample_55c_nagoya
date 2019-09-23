# freemarket_sample_55c_nagoya

##usersテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null:false|
|email|string|null:false, unique:true|
|password|string|null:false|

###Association

##creditcardテーブル
|Column|Type|Option|
|------|----|------|
|token|text|
|user_id|integer|null:false, foreign_key:true|

###Association


##sns_credentialsテーブル
|Column|Type|Option|
|------|----|------|
|token|text|
|uid|string|
|provider|integer|

###Association


##profile
|Column|Type|Option|
|------|----|------|
|content|text|
|
