   # usersテーブル

| colum          |  Type       | Options      |
| -------------- | ----------- | ------------ |
| email          | string      | NOT NULL     |
| password       | string      | NOT NULL     |
| nickname       | string      | NOT NULL     |
| firstname      | string      | NOT NULL     |
| lastname       | string      | NOT NULL     |
| firstname-kana | string      | NOT NULL     |
| lastname-kana  | string      | NOT NULL     |
| birthday       | date        | NOT NULL     |

  ## Association
 - has_many :products
 - has_many :purchase

  # productsテーブル
| Colum          |  Type       | Options      |
| -------------- | ----------- | ------------ |
| title          | string      | NOT NULL     |
| description    | text        | NOT NULL     |
| details        | text        | NOT NULL     |
| status         | integer     | NOT NULL     |
| shipping_fee   | integer     | NOT NULL     |
| prefecture     | integer     | NOT NULL     |
| day_ship       | integer     | NOT NULL     |
| price          | integer     | NOT NULL     |
| user           | reference   |              |

  ## Association
 - belongs_to :user
 - has_one :purchase

  # purchasesテーブル
| Colum          | Type        | Options      |
| -------------- | ----------- | ------------ |
| user           | reference   | NOT NULL     |
| product        | reference   | NOT NULL     |

  ## Association
 - belongs_to :user
 - belong_to :products
 - has_one :shipping_add

  # shipping_addデーブル
| Colum         | Type        | Options       |
| ------------- | ----------- | ------------- |
| user          | reference   | NOT NULL      |
| address       | text        | NOT NULL      |
| phone_num     | integer     | NOT NULL      |

 ## Association
 - belongs_to :purchase


