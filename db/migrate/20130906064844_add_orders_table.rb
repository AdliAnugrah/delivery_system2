class AddOrdersTable < ActiveRecord::Migration
	def change
		create_table :orders do |t|
			t.string :name
			t.float :price
			t.integer :quantity
			t.string :type 
			t.string :image 
			t.integer :category_id
			t.integer :restaurant_id
			t.integer :user_id

			t.timestamps
		end
	end
end
