class Product < ActiveRecord::Base
	extend FriendlyId
  friendly_id :name, use: :slugged

 validates :name , presence:true
 validates :quantity, numericality: { only_integer: true , :greater_than_or_equal_to =>0}
 validates :price, numericality: { only_integer: true, :greater_than_or_equal_to =>0}

  attr_accessible :name, :price, :quantity, :type




end
