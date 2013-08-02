class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :province
      t.string :slug
      t.timestamps
    end
    add_index :restaurants, :slug, unique: true
  end
end
