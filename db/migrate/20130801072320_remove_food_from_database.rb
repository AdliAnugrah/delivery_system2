class RemoveFoodFromDatabase < ActiveRecord::Migration
  def up
  	drop_table :foods
  end

  def down
  	 create_table :foods do |t|
      t.string :nama
      t.string :type
      t.decimal :price

      t.timestamps
    end
  end
end
