class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :camp
      t.text :address
      t.string :district

      t.timestamps
    end
    add_index :addresses, :camp_id
  end
end
