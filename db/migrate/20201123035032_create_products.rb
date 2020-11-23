class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :explanation
      t.string :image
      t.integer :price
      t.boolean :is_pierce, default: false
      t.boolean :is_sold_one, default: false
      t.boolean :is_hidden, default: false
      t.integer :user_id

      t.timestamps
    end
  end
end
