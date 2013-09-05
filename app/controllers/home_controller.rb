class HomeController < ApplicationController
	
		def  index
				
				@products = Product.all
		end
		
end





		# def  index
		# 		@category =  Category.find_by_name('Fast Food')
		# 		@products = @category.products
		# end