## userテーブル
| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| family_name          | string | null: false |
| first_name           | string | null: false |
| family_name_katakana | string | null: false |
| first_name_katakana  | string | null: false |
| encrypted_password   | text   | null: false |
| e_mail               | string | null: false |
| birthday             | date   | null: false |
|                      |        |             |

### Association
- has_many :products
- has_many :buy

## product
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| category_id      | interger   | null: false                    |
| status_id        | interger   | null: false                    |
| delivery_fee_id  | interger   | null: false                    |
| shipping_area_id | interger   | null: false                    |
| says_to_ship-id  | interger   | null: false                    |
| price            | interger   | null: false                    |
| explanation      | text       | null: false                    |
| user             | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :buy

## buy
| Column     | Type       | Option                         |
| ---------- | ---------- | ------------------------------ |
| user_id    | references | null: false, foreign_key: true |
| product_id | references | null: false, foreign_key: true |
|            |            |                                |



## Street address
| Column         | Type     | Option      |
| -------------- | -------- | ----------- |
| postal_code    | string   | null: false |
| prefectures_id | interger | null: false |
| municipality   | string   | null: false |
| address        | string   | null: false |
| phone_number   | string   | null: false |
| building_name  | string   |             |
|                |          |             |

### Association
- belongs_to :buy
