class AddDeletedAtToEmployees < ActiveRecord::Migration[5.2]
  def change
    remove_column :employees, :status
    add_column :employees, :deleted_at, :datetime
    add_index :employees, :deleted_at
  end
end
