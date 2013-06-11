class CreateRegisters < ActiveRecord::Migration
  def change
    create_table :registers do |t|
      t.string :title
      t.attachment :attachment

      t.timestamps
    end
  end
end
