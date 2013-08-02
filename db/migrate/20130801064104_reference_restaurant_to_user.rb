class ReferenceRestaurantToUser < ActiveRecord::Migration
  def up
  	create_table :restaurants_users do |t|
  		t.belongs_to :restaurant
  		t.belongs_to :user
		end

  end

  def down
  	drop_table :restaurants_users

  end
end
