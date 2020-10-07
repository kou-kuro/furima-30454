   # usersテーブル

| colum          |  Type       | Options      |
| -------------- | ----------- | ------------ |
| email          | string      | NOT NULL     |
| password       | string      | NOT NULL     |
| nickname       | string      | NOT NULL     |
| firstname      | string      | NOT NULL     |
| lastname       | string      | NOT NULL     |
| firstname_kana | string      | NOT NULL     |
| lastname_kana  | string      | NOT NULL     |
| birthday       | date        | NOT NULL     |

  ## Association
 - has_many :products
 - has_many :purchases

  # productsテーブル
| Colum          |  Type       | Options      |
| -------------- | ----------- | ------------ |
| title          | string      | NOT NULL     |
| description    | text        | NOT NULL     |
| category       | integer     | NOT NULL     |
| status         | integer     | NOT NULL     |
| shipping_fee   | integer     | NOT NULL     |
| prefecture     | integer     | NOT NULL     |
| day_ship       | integer     | NOT NULL     |
| price          | integer     | NOT NULL     |
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
| user          | reference   | foreign_key   |
| post_num      | integer     | NOT NULL      |
| prefecture    | integer     | NOT NULL      |
| city          | string      | NOT NULL      |
| address       | integer     | NOT NULL      |
| building      | string      | NOT NULL      |
| phone_num     | integer     | NOT NULL      |


 ## Association
 - belongs_to :purchase


