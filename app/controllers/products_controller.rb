class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :new]
  before_action :move_to_new, only: [:edit]
  before_action :set_product, only: [:edit, :update, :show]

  def index
    @product = Product.includes(:user).order('created_at DESC')
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
  end

  def edit
    redirect_to root_path unless current_user.id == @product.user_id
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def move_to_new
    redirect_to action: :new unless user_signed_in?
  end

  def set_product
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :day_ship_id, :price, :image).merge(user_id: current_user.id)
  end
end
