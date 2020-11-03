class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:index, :create]

  def index
    @order_form = OrderForm.new
    if @product.order != nil
      redirect_to root_path
    else
      if @product.user == current_user
        redirect_to root_path
      end
    end
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end


  private
  def set_product
    @product = Product.find(params[:product_id])
  end

  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :building, :house_number, :phone_number)
    .merge(product_id: params[:product_id], user_id: current_user.id, token: params[:token])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                # 通貨の種類（日本円）
    )
  end
end