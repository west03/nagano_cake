class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, default: "", null: false
      t.string :image_id, default: "", null: false
      t.text :introduction, default: "", null: false
      t.integer :price, default: "", null: false
      t.boolean :is_active, default: "", null: false
      t.datetime :created_at, null: false, default: "%F%D%T"
      t.datetime :updated_at, null: false, default: "%F%D%T"
      t.integer :genre_id
     
      t.timestamps
    end
  end
end
