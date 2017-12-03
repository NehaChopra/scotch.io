class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :description,       null: false, default: ""
      t.string :name,              null: false, default: ""
      t.boolean :status,           null: false, default: false
      t.decimal :price, precision: 12, scale: 3, null: false, default: 0.0

      t.timestamps null: false

    end

    add_index :products, :name,                unique: true
    add_index :products, :description,         unique: true
  end
end
