class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :sku, null: false
      t.string :name, null: false
      t.string :description, default: ''
      t.decimal :price, precision: 8, scale: 2, null: false
      t.integer :stock, default: 0

      t.timestamps
    end
  end
end
