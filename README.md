# README

## Description
- フリーマーケットアプリ（メルカリ）のクローンサイト。

## FEATURES
- haml/SASS記法と、命名規則BEMを使ったマークアップ
- ウィザード形式を用いたユーザー登録
- ajaxを使用した非同期処理
- pay.jpによる購入処理
- 商品検索機能
- カテゴリー機能
- お気に入り機能
- パンくず機能

## DEMO
- ユーザー新規登録画面
![image](https://user-images.githubusercontent.com/60598010/77883871-efb16100-729e-11ea-847c-bb5a47158ed0.png)

- 商品編集画面
![image](https://user-images.githubusercontent.com/60598010/77884180-8847e100-729f-11ea-923c-ed6c1e22535d.png)

- お気に入り機能（非同期）
![お気に入り機能 確認画面](https://user-images.githubusercontent.com/60733386/77893365-c7c9f980-72ae-11ea-9fd2-e49ef246a50a.gif)

## Requirement
- Ruby 2.5.1
- Rails 5.2.3

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|mail|string|null: false|
|password|string|null: false|
|family_name|string|null: false|
|family_name_kana|string|null: false|
|birthday|string|null: false|
|avatar|text||
|profile|text||
|sex|string||

### Association
- has_many :items
- has_many :cards
- has_many :reviews
- has_many :comments
- has_many :likes
- has_many :bookmarks
- has_many :points
- has_many :addresses

## addresses
|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|phone_number|string||
|post_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||
|user|references|foreign_key: true|


### Association
- belongs_to :user


## items
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|text|text|null: false|
|price|integer|null: false|
|status|integer|null: false|
|delivery_charge_id|integer|null: false|
|delivery_method|string|null: false|
|delivery_size|string|null: false|
|delivery_origin|string|null: false|
|delivery_days|string|null: false|
|category|references|null: false, foreign_key: true|
|brand|references|foreign_key: true|
|history|references|foreign_key: true|
|saler|references|null: false, foreign_key: true|
|buyer|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :point
- belongs_to :category
- belongs_to :brand
- belongs_to :history
- belongs_to :review
- has_many :comments
- has_many :likes
- has_many :images


## cards
|Column|Type|Options|
|------|----|-------|
|customer_id|string|null: false|
|card_id|string|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## reviews
|Column|Type|Options|
|------|----|-------|
|text|text||
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## likes
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## bookmarks
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## points
|Column|Type|Options|
|------|----|-------|
|point|integer||
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## comments
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## images
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :item

## categories
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|integer||

### Association
- belongs_to :item

## brands
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- belongs_to :item

## histories
|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :item
