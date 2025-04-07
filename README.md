# furima-41903テーブル設計

## users テーブル
| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false, unique: true      |
| nick_name          | string     | null: false, unique: true      |
| first_name         | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| birthday           | date       | null: false                    |

### Association

- has_many :orders
- has_many :items
- has_many :comments

## orders テーブル
| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :items


## items テーブル
| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| item_index         | text       | null: false                    |
| item_status_id     | text       | null: false                    |
| item_category_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| shipping_cost_id   | integer    | null: false                    |
| shipping_date_id   | date       | null: false                    |
| user               | references | null: false                    |

### Association

- belongs_to :user
- has_one :order
- has_many :comments
- has_one_attached :image

## address テーブル
| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postcode           | integer    | null: false                    |
| prefectures_id     | string     | null: false                    |
| city               | string     | null: false                    |
| block              | string     | null: false                    |
| building           | string     |                                |
| phone_number       | integer    | null: false                    |

### Association

-belongs_to :order

## comments テーブル
| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |
| text               | text       | null: false

belongs_to :user
belongs_to :item