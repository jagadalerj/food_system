class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name,               null: false, default: ""
      t.string :size
      t.float :price

      t.timestamps null: false
    end
  end
end
