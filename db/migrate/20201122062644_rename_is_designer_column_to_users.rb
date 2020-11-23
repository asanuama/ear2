class RenameIsDesignerColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :is_designer?, :is_designer
  end
end
