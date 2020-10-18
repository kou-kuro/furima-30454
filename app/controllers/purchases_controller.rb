class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_product, only: [:index, :create, :move_to_root_path]
  before_action :move_to_root_path, only: [:index]

  def index
    @payment = Payment.new
  end

  def new
  end

  def create
    @payment = Payment.new(purchase_params)
    if @payment.valid?
      pay_item
      @payment.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
  def move_to_root_path
    if user_signed_in? && current_user.id == @product.user_id
      redirect_to root_path
    elsif @product.purchase.present?
      redirect_to root_path
    end
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def purchase_params
    params.permit(:post_num, :prefecture_id, :city, :address, :building, :phone_num, :purchase_id, :product_id, :authenticity_token, :token).merge(token: params[:token], user_id: current_user.id)
  end
end
