class Restaurant < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

 validates :name , presence:true
 validates_uniqueness_of :name

  attr_accessible :address, :city, :name, :province


belongs_to :user
end
