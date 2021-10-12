class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :item_id, default: "", null: false
      t.integer :order_id, default: "", null: false
      t.integer :price, default: "", null: false
      t.integer :amount, default: "", null: false
      t.integer :making_status, default: 0, null: false
      t.datetime :created_at,  null: false, default: "%F%D%T"
      t.datetime :updated_at,  null: false, default: "%F%D%T"

      t.timestamps
    end
  end
end
