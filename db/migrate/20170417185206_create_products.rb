class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.string :status
      t.decimal :price
      t.integer :stock_quantity
      t.text :description

      t.timestamps
    end
  end
end
