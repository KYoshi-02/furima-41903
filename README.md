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
| birthday           | date       | null: false                    |
| password           | string     | null: false                    |
| phone_number       | text       | null: false,                   |
| address            | references | null: false, foreign_key: true |
| cards              | references | null: false, foreign_key: true |

### Association

- has_many :orders
- has_many :items
- has_one :address
- has_one :cards

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
| price              | integer    | null: false                    |
| shipping_cost      | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to :order
- has_one: address
- has_one_attached :image

## address テーブル
| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | integer    | null: false                    |
| prefectures        | string     | null: false                    |
| municipality       | string     | null: false                    |
| building_name      | string     | null: true                     |
### Association

-belongs_to :user
-belongs_to :item

## comment テーブル
| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |

belongs_to :user

## cards テーブル
| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| customer_id        | integer    | null: false                    |
| card_id            | integer    | null: false                    |

belongs_to :user