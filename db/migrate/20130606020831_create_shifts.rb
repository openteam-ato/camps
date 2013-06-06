class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.string :title
      t.date :starts_on
      t.date :ends_on
      t.integer :price
      t.integer :age_min
      t.integer :age_max
      t.references :camp

      t.timestamps
    end
    add_index :shifts, :camp_id
  end
end
