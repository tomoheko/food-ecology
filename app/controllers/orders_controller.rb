class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:index, :create]

  def index
    @order = Order.new
    # if @product.order != nil
    #   redirect_to root_path
    # else
    #   if @product.user == current_user
    #     redirect_to root_path
    #   end
    # end
  end

  def create
    @order = Order.new(order_params)
    if @user_order.valid?
      
      @user_order.save
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
    params.require(:user_order).permit(:postal_code, :prefecture_id, :city, :building, :house_number, :phone_number)
    .merge(product_id: params[:product_id], user_id: current_user.id, token: params[:token])
  end
end