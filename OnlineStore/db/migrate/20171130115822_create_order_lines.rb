class CreateOrderLines < ActiveRecord::Migration[5.1]
  def change
    create_table :order_lines do |t|
      t.integer :order_id,          null: false
      t.integer :product_id,        null: false
      t.integer :qty,               null: false, default: 0
      t.decimal :unit_price, precision: 12, scale: 3, null: false, default: 0.0
      t.decimal :total_price, precision: 12, scale: 3, null: false, default: 0.0

      t.timestamps null: false
    end


    add_index :order_lines, :order_id,                unique: true
  end
end
