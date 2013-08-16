class Category < ActiveRecord::Base

	validates :name , presence:true
	 validates_uniqueness_of :name
	
  attr_accessible :name

  has_many :products
  
end
