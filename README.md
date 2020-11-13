## userテーブル
| Column               | Type     | Options     |
| -------------------- | -------- | ----------- |
| family name          | string   | null: false |
| first name           | string   | null: false |
| family name katakana | string   | null: false |
| first name katakana  | string   | null: false |
| password             | text     | null: false |
| e-mail               | text     | null: false |
| Birthday             | interger | null: false |
|                      |          |             |

### Association
- has_many :Products
- has_many :Purchases

## Product
| Column        | Type           | Options                        |
| ------------- | -------------- | ------------------------------ |
| image         | Active Storage | null: false                    |
| name          | text           | null: false                    |
| category      | interger       | null: false                    |
| status        | interger       | null: false                    |
| Delivery fee  | interger       | null: false                    |
| Shipping area | interger       | null: false                    |
| Days to ship  | interger       | null: false                    |
| price         | interger       | null: false                    |
| Explanation   | text           | null: false                    |
| user          | references     | null: false, foreign_key: true |
|               |                |                                |

### Association
- belongs_to :user
- belongs_to :Purchase

## Purchase
| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| credit card information | interger   | null: false                    |
| security code           | interger   | null: false                    |
| expiration date         | interger   | null: false                    |
| user                    | references | null: false, foreign_key: true |
|                         |            |                                |

### Association
- has_many :user
- belongs_to :Product
- belongs_to :Street address

## Street address
| Column        | Type     | Option      |
| ------------- | -------- | ----------- |
| Postal code   | interger | null: false |
| Prefectures   | interger | null: false |
| Municipality  | text     | null: false |
| address       | text     | null: false |
| phone number  | interger | null: false |
| Building name | text     |             |
|               |          |             |

### Association
- belongs_to :Purchase