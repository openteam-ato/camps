class CreateCamps < ActiveRecord::Migration
  def change
    create_table :camps do |t|
      t.string :title
      t.string :kind
      t.text :description

      t.timestamps
    end
  end
end
