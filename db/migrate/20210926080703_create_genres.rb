class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :name, default: "", null: false
      t.datetime :created_at, null: false, default: "%F%D%T"
      t.datetime :updated_at, null: false, default: "%F%D%T"

      t.timestamps
    end
  end
end
