class ProductsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    # @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_new_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_new_params
    params.require(:product).permit(:name, :image, :price, :explanation, :category_id, :condition_id, :prefecture_id, :shipment_term_id, :shipment_fee_id).merge(user_id: current_user.id)
  end
end
