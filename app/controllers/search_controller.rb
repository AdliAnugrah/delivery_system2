class SearchController < ApplicationController
  def index
  	@products = Product.where('name like ?', "%#{params[:q]}%")
  end
end
