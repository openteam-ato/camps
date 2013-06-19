class RenameTable < ActiveRecord::Migration
  def change
    rename_table :shifts, :seasons
  end
end
