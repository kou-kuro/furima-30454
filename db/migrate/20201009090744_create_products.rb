class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :category_id, null: false
      t.string :status_id, null: false
      t.string :shipping_fee_id, null: false
      t.string :prefecture_id, null: false
      t.string :day_ship_id, null: false
      t.string :price, null: false
      t.references :user, foreign_key: true
      t.timestamps

      
       belongs_to :user
       has_one :purchase

    end
  end
end
