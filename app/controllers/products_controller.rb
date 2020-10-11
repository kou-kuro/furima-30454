class ProductsController < ApplicationController


  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    end

 private
 def product_params
  params.require(:product).permit(:title, :description, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :day_ship_id, :price, :image).merge(user_id: current_user.id)
 end

end


