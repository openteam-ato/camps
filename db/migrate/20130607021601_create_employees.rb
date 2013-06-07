class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.references :camp
      t.string :full_name
      t.string :post
      t.string :phone_number

      t.timestamps
    end
    add_index :employees, :camp_id
  end
end
