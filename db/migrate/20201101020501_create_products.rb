class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string  :name,             null: false
      t.integer :price,            null: false
      t.string  :quantity,         null: false
      t.text    :explanation,      null: false
      t.integer :category_id,      null: false
      t.integer :condition_id,     null: false
      t.integer :prefecture_id,    null: false
      t.integer :shipment_term_id, null: false
      t.integer :shipment_fee_id,  null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
