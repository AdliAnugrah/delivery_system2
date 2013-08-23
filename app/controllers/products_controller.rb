class ProductsController < ApplicationController
  def index
    
      if params[:name]
        @products = Product.where('name like ?', "%#{params[:name]}%")
      else
        @products = Product.all
      end
  end

  def show
     @product = Product.find(params[:id])
  end

  def new
         @product = Product.new
  end

  def create
       @product = Product.new(params[:product])

       if @product.save
          redirect_to product_path(@product)
        else
            render :new
        end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
       @product = Product.find(params[:id])

       if @product.update_attributes(params[:product])
          redirect_to product_path(@product)
        else
            render :new
        end

  end

  def destroy
     @product = Product.find(params[:id])

      @product.destroy
          redirect_to products_url
        
        

  end


end
