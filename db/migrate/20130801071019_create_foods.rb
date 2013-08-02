class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :nama
      t.string :type
      t.decimal :price

      t.timestamps
    end
  end
end
