## userテーブル
| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| nickname             | string | null: false |
| family_name          | string | null: false |
| first_name           | string | null: false |
| family_name_katakana | string | null: false |
| first_name_katakana  | string | null: false |
| encrypted_password   | string | null: false |
| email                | string | null: false |
| birthday             | date   | null: false |
|                      |        |             |

### Association
- has_many :items
- has_many :buys

## itemテーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| delivery_fee_id  | integer    | null: false                    |
| shipping_area_id | integer    | null: false                    |
| says_to_ship_id  | integer    | null: false                    |
| price            | integer    | null: false                    |
| explanation      | text       | null: false                    |
| user             | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :buy

## buyテーブル
| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
|         |            |                                |

### Association
- belongs_to :user
- belongs_to :item
- has_one :street_address



## street_address
| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| shipping_area_id | integer    | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| phone_number     | string     | null: false                    |
| building_name    | string     |                                |
| buy              | references | null: false, foreign_key: true |
|                  |            |                                |

### Association
- belongs_to :buy
