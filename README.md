# README

資金繰り表のモデル化を行う、


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|employee_number|integer|null: false|
|email|string|null: false|
|password|string|null: false|
|encrypted_password|string|null: false|

### Association
- has_many :incomes
- has_many :expenses



## incomesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|income1|integer|default: ""|
|income2|integer|default: ""|
|income3|integer|default: ""|
|income4|integer|default: ""|
|income5|integer|default: ""|
|income6|integer|default: ""|
|income7|integer|default: ""|
|income8|integer|default: ""|
|income9|integer|default: ""|
|income10|integer|default: ""|
|year|integer|null: false|
|month|integer|null: false|
|day|integer|null: false|

### Association
- has_many :category_incomes
- belongs_to :user

## expensesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|expense1|integer|default: ""|
|expense2|integer|default: ""|
|expense3|integer|default: ""|
|expense4|integer|default: ""|
|expense5|integer|default: ""|
|expense6|integer|default: ""|
|expense7|integer|default: ""|
|expense8|integer|default: ""|
|expense9|integer|default: ""|
|expense10|integer|default: ""|
|expense11|integer|default: ""|
|expense12|integer|default: ""|
|expense13|integer|default: ""|
|expense14|integer|default: ""|
|expense15|integer|default: ""|
|year|integer|null: false|
|month|integer|null: false|
|day|integer|null: false|

### Association
- has_many :category_expenses
- belongs_to :user


