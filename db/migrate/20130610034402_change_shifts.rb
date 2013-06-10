class ChangeShifts < ActiveRecord::Migration
  def change
    rename_column :shifts, :price, :price_min
    add_column :shifts, :price_max, :integer
  end
end
