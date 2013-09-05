class Order < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :price, :quantity, :type , :image , :category_id, :restaurant_id, :user_id

  mount_uploader :image, ImageUploader
  has_and_belongs_to_many :product
  belongs_to :user
end
