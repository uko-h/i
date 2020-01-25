# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_many :posts
- has_many :categories

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|
|image|string|
|user_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :category


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null: false, unique: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- has_many :posts
- belongs_to :user