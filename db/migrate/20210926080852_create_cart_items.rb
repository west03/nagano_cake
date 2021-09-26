class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :item_id, default: "", null: false
      t.integer :customer_id, default: "", null: false
      t.integer :amount, default: "", null: false
      t.datetime :created_at, null: false, default: "%F%D%T"
      t.datetime :updated_at, null: false, default: "%F%D%T"

      t.timestamps
    end
  end
end
