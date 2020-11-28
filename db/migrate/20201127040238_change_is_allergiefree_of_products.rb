class ChangeIsAllergiefreeOfProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :is_allergiefree, :boolean, :default => 'false'
  end
end
