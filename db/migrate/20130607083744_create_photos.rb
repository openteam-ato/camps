class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :camp
      t.attachment :image

      t.timestamps
    end
    add_index :photos, :camp_id
  end
end
