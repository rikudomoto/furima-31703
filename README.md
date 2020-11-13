## userテーブル
| Column               | Type     | Options     |
| -------------------- | -------- | ----------- |
| family_name          | string   | null: false |
| first_name           | string   | null: false |
| family_name_katakana | string   | null: false |
| first_name_katakana  | string   | null: false |
| password             | text     | null: false |
| e-mail               | text     | null: false |
| Birthday             | interger | null: false |
|                      |          |             |

### Association
- has_many :Products
- has_many :Street address

## Product
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| category      | interger   | null: false                    |
| status        | interger   | null: false                    |
| delivery_fee  | interger   | null: false                    |
| shipping_area | interger   | null: false                    |
| says_to_ship  | interger   | null: false                    |
| price         | interger   | null: false                    |
| explanation   | text       | null: false                    |
| user          | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :Street address


## Street address
| Column         | Type     | Option      |
| -------------- | -------- | ----------- |
| postal_code    | string   | null: false |
| prefectures_id | interger | null: false |
| municipality   | string   | null: false |
| address        | string   | null: false |
| phone_number   | string   | null: false |
| building_name  | text     |             |
|                |          |             |

### Association
- belongs_to :Purchase
- belongs_to :user