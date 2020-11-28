class AddColumnProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :is_allergiefree, :boolean
  end
end
