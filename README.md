

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many items 
- has_many buyers


## items テーブル

| Column              | Type        | Options           |
| ------------------- | ----------- | ----------------- |
| name                | string      | null: false       |
| comment             | text        | null: false       |
| category_id         | integer     | null: false       |
| condition_id        | integer     | null: false       |
| shipping_charges_id | integer     | null: false       |
| prefecture_id       | integer     | null: false       |
| days_to_ship_id     | integer     | null: false       |
| price               | integer     | null: false       | 
| user                | references  | foreign_key: true |


### Association
- belongs_to :user
- has_one buyer

## buyers テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| user            | references | foreign_key: true |
| item            | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one address



## addresss テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| postal_code    | string     | null: false       |
| prefecture_id  | integer    | null: false       |
| municipality   | string     | null: false       |
| address        | string     | null: false       |
| building_name  | string     |                   |
| phone_number   | string     | null: false       |
| buyer          | references | foreign_key: true |

### Association
- belongs_to :buyer