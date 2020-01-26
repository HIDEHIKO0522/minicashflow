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
|income1|integer|default: "0"|
|income2|integer|default: "0"|
|income3|integer|default: "0"|
|income4|integer|default: "0"|
|income5|integer|default: "0"|
|income6|integer|default: "0"|
|income7|integer|default: "0"|
|income8|integer|default: "0"|
|income9|integer|default: "0"|
|income_total|integer|default: ""|
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
|expense1|integer|default: "0"|
|expense2|integer|default: "0"|
|expense3|integer|default: "0"|
|expense4|integer|default: "0"|
|expense5|integer|default: "0"|
|expense6|integer|default: "0"|
|expense7|integer|default: "0"|
|expense8|integer|default: "0"|
|expense9|integer|default: "0"|
|expense_total|integer|default: ""|
|year|integer|null: false|
|month|integer|null: false|
|day|integer|null: false|

### Association
- has_many :category_expenses
- belongs_to :user


