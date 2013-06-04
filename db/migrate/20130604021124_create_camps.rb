class CreateCamps < ActiveRecord::Migration
  def change
    create_table :camps do |t|
      t.string :title
      t.string :kind
      t.text :description
      t.text :address
      t.string :district

      t.timestamps
    end
  end
end
