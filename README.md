# README
## usersテーブル
| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| nickname          | string     | null: false |
| email             | string     | null: false |
| password          | string     | null: false |
| family_name       | string     | null: false |
| first_name        | string     | null: false |
| birth_date        | date       | null: false |

### Association
- has_many :products
- has_many :comments
- has_many :orders



## productsテーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| price            | integer    | null: false                    |
| quantity         | integer    | null: false                    |
| explanation      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipment_term_id | integer    | null: false                    |
| shipment_fee_id  | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- has_one_attached :image
- belongs_to :user
- has_many   :comments
- has_one    :order



## commentsテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product



## addressテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association
- belongs_to :order



## ordersテーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| product    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product
- has one    :address