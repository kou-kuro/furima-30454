class ProductsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @Product = Product.includes(:user).order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :day_ship_id, :price, :image).merge(user_id: current_user.id)
  end
end
