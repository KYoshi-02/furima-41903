# furima-41903テーブル設計

## users テーブル
| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| nick_name          | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| birth_date         | date       | null: false                    |
| password           | string     | null: false, with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/                |
| phone_number       | text       | null: false,                   |
| address            | references | null: false, foreign_key: true |
| comments           | text       | null: true                     |

### Association

- has_many :orders
- has_many :items
- has_one :address

## orders テーブル
| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :items


## items テーブル
| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| item_index         | text       | null: false                    |
| item_status        | text       | null: false                    |
| item_category      | text       | null: false                    |
| item_price         | integer    | null: false                    |
| item_shipping_cost | integer    | null: false                    |
| address            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order
- has_one: address
- has_one_attached :image

## address テーブル
| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
|             | text       | null: false                    |
|           | text       | null: false, foreign_key: true |
|                | text       | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item