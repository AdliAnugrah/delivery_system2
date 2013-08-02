class Category < ActiveRecord::Base

	validates :nama , presence:true
	
  attr_accessible :nama
  
end
