class AddDistrictIdToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :district_id, :integer
  end
end
