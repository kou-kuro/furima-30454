class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_root_path, only: [:index]

  def index
    @product = Product.find(params[:product_id])
    @payment = Payment.new
  end

  def new
  end

  def create
    @product = Product.find(params[:product_id])
    @payment = Payment.new(purchase_params)
    if @payment.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @product.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )

      @payment.save
      redirect_to root_path
    else
      render :index
    end
  end

  def move_to_root_path
    @product = Product.find(params[:product_id])
    if user_signed_in? && current_user.id == @product.user_id
      redirect_to root_path
    elsif @product.purchase.present?
      redirect_to root_path
    end
  end

  private

  def purchase_params
    params.permit(:post_num, :prefecture_id, :city, :address, :building, :phone_num, :purchase_id, :product_id, :authenticity_token, :token).merge(token: params[:token], user_id: current_user.id)
  end
end
