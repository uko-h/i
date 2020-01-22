# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_many :posts
- has_many :users_categories
- has_many :categories, through: :users_categories


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

### Association
- has_many :posts
- has_many :users_categories
- has_many :users, through: :users_categories


## users_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :category
- belongs_to :user