class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :number
      t.references :camp

      t.timestamps
    end
    add_index :phones, :camp_id
  end
end
