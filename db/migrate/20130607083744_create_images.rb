class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :camp
      t.attachment :file

      t.timestamps
    end
    add_index :images, :camp_id
  end
end
