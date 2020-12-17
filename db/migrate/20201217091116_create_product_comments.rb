class CreateProductComments < ActiveRecord::Migration[5.2]
  def change
    create_table :product_comments do |t|
      t.text :comment

      t.timestamps
    end
  end
end
