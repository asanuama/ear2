class AddColumnProductComments < ActiveRecord::Migration[5.2]
  def change
    add_column :product_comments, :user_id, :integer
    add_column :product_comments, :product_id, :integer
  end
end
