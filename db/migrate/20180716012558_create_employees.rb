class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :identification
      t.string :first_name
      t.string :last_name
      t.string :address
      t.bigint :phone
      t.integer :gender
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
