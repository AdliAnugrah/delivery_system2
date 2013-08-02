class Restaurant < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

 validates :name , presence:true

  attr_accessible :address, :city, :name, :province


belongs_to :user
end
