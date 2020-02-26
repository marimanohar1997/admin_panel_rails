class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :quantity
      t.integer :price
      t.integer :size
      t.integer :discount
      t.integer :stock
      t.integer :selling_price
      t.string :color
      t.string :gender
      t.string :specification
      t.string :category
      t.references :brand, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
