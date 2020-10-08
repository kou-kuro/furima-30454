   # usersテーブル

| colum          |  Type       | Options      |
| -------------- | ----------- | ------------ |
| email          | string      | null: false  |
| password       | string      | null: false  |
| nickname       | string      | null: false  |
| firstname      | string      | null: false  |
| lastname       | string      | null: false  |
| firstname_kana | string      | null: false  |
| lastname_kana  | string      | null: false  |
| birthday       | date        | null: false  |

  ## Association
 - has_many :products
 - has_many :purchases

  # productsテーブル
| Colum          |  Type       | Options      |
| -------------- | ----------- | ------------ |
| title          | string      | null: false  |
| description    | text        | null: false  |
| category_id    | integer     | null: false  |
| status_id      | integer     | null: false  |
| shipping_fee_id| integer     | null: false  |
| prefecture_id  | integer     | null: false  |
| day_ship_id    | integer     | null: false  |
| price          | integer     | null: false  |
| user           | reference   | foreign_key  |

  ## Association
 - belongs_to :user
 - has_one :purchase

  # purchasesテーブル
| Colum          | Type        | Options      |
| -------------- | ----------- | ------------ |
| user           | reference   | foreign_key  |
| product        | reference   | foreign_key  |

  ## Association
 - belongs_to :user
 - belong_to :product
 - has_one :shipping_add

  # shipping_addデーブル
| Colum         | Type        | Options       |
| ------------- | ----------- | ------------- |
| purchase      | reference   | foreign_key   |
| post_num      | string      | null: false   |
| prefecture_id | integer     | null: false   |
| city          | string      | null: false   |
| address       | string      | null: false   |
| building      | string      |               |
| phone_num     | string      | null: false   |


 ## Association
 - belongs_to :purchase


