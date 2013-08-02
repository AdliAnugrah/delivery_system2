class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :type
      t.integer :quantity
      t.decimal :price
      t.string :slug

      t.timestamps
    end

    add_index :products, :slug, unique: true
  end
end
