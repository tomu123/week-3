class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.date :date, default: -> { 'CURRENT_TIMESTAMP' }
      t.references :customer, null: false, foreign_key: true
      t.decimal :total, precision: 8, scale: 2, default: 0

      t.timestamps
    end
  end
end
