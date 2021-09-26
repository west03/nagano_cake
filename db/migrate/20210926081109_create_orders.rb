class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id, default: "", null: false
      t.string :postal_code, default: "", null: false
      t.string :address, default: "", null: false
      t.string :name, default: "", null: false
      t.integer :postage_cost, default: "", null: false
      t.integer :total_payment, default: "", null: false
      t.integer :payment_method, default: "", null: false
      t.integer :status, default: "", null: false
      t.datetime :created_at, null: false, default: "%F%D%T"
      t.datetime :updated_at, null: false, default: "%F%D%T"

      t.timestamps
    end
  end
end
