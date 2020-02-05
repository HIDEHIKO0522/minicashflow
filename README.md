# README

*/アプリ/*
現金収支表（Cashflow)簡易版の作成

*/作成意図/*
通常エクセルなどの表計算ソフトや経理ソフトで作成することが多い現金収支表ですが、中小、零細企業では下記理由で作成できていないケースが多く見られます。
①作成、管理する時間がない。
②市販の経理ソフトでは操作が難しい。
そこで簡単な操作機能で大枠で現金収支が把握できるアプリを作りたいと思い、作成しました。

*/作成期間/*
7日（1日約8時間）

*/バージョン等/*
・Rails 5.2.3 
・ruby 2.5.1
・chart-js-rails 0.1.4
・gon 6.2.0

*/主な実装（gem)/*
・chart-js（グラフ）
・gon（グラフへのrailsデータ連携）
・kaminari(ページネーション)
・devise(ログイン)
・ransack(検索)

*/主な実装/*
①登録,編集、削除機能
　資金の入出金を指定項目に入力する。登録データは後に編集・削除が可能なため、実入出金のみならず未来の入出金も登録し、金額確定後は編集機能で修正可能にする。
　登録は日別で行い、後に集計機能にて月別集計が可能。

②検索機能
　登録したデータを登録一覧あるいは登録日を指定して検索できるようにする。
　検索データは編集、削除が可能。

③集計機能
　現時点まで登録したデータを元に、月別集計を行う。結果はグラフ化して視覚的に見やすくする。
　収入、支出合計の他に資金繰越額も表示し、資金の増減状況も把握できるようにする。


*/コントローラ/*
Tops_controller(トップ画面：index)
Flows_controller(メイン機能：new,show,edit,destroy,report)
Search_controller(検索結果表示：index) namespaceを使用

*/テーブル/*
下記2テーブル作成

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
なし

## flowsテーブル
|Column|Type|Options|
|------|----|-------|
|year_month_day||null: false,unique: true|
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

### Association
なし




