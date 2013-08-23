class District < ActiveRecord::Base
  attr_accessible :location_id, :name

  belongs_to :location 
  has_many :restaurants
end
