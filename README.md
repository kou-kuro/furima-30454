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
| birthday       | integer     | NOT NULL     |

  ## Association
 - has_many :products
 - belongs_to :purchase

  # productテーブル
| Colum          |  Type       | Options      |
| -------------- | ----------- | ------------ |
| title          | string      | NOT NULL     |
| description    | text        | NOT NULL     |
| details        | text        | NOT NULL     |
| address        | integer     | NOT NULL     |
| price          | integer     | NOT NULL     |
| image          | ActiveStorageで実装         |

  ## Association
 - belongs_to :user
 - belongs_to :purchase
 - has_one :image

  # purchaseテーブル
| Colum          | Type        | Options      |
| -------------- | ----------- | ------------ |
| cardnum        | integer     | NOT NULL     |
| expiration     | integer     | NOT NULL     |
| cvccode        | ineger      | NOT NULL     |

  ## Association
 - belongs_to :user
 - has_many :products


