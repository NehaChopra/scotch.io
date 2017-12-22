class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :order_no,          null: false, default: ""
      t.integer :customer_id,      null: false
      t.datetime :date,            null: false
      t.decimal :total, precision: 12, scale: 3, null: false, default: 0.0

      t.timestamps null: false
    end

    add_index :orders, :date,                unique: true
    add_index :orders, :order_no,         unique: true
  end
end
