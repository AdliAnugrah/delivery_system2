class Restaurant < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

 validates :name , presence:true
 validates_uniqueness_of :name

  attr_accessible :address, :city, :name, :province, :phone, :image, :district_id


belongs_to :user
 mount_uploader :image, RestaurantImageUploader
 has_many :products
 belongs_to :district
end
