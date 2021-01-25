class ProductsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  def index
    @products = Product.all.order("created_at DESC")
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
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

  def show
    @comment = Comment.new
    @comments = @product.comments.includes(:user)
  end

  def edit
    unless current_user.id == @product.user_id
      redirect_to root_path
    end
  end

  def update
    if @product.update(product_new_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @product.user_id
    @product.destroy
    redirect_to root_path
    end
  end

  def search
    @products = Product.search(params[:keyword])
  end

  private

  def product_new_params
    params.require(:product).permit(:name, :image, :quantity, :price, :explanation, :category_id, :condition_id, :prefecture_id, :shipment_term_id, :shipment_fee_id).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
