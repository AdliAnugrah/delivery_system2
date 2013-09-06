class CreateOrders < ActiveRecord::Migration
 def change
  create_table :orders_products do |t|
    t.belongs_to :orders
    t.belongs_to :products 
    t.belongs_to :user

    t.timestamps
  end
	end
end