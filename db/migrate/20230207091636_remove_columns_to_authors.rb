class RemoveColumnsToAuthors < ActiveRecord::Migration[7.0]
  def change
    remove_column :authors, :password
  end
end
