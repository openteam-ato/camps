class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.text :url
      t.references :camp

      t.timestamps
    end
    add_index :links, :camp_id
  end
end
