class ProductsController < ApplicationController
  # skip_before_action :verify_authenticity_token
   before_action :authorize_request, only: [:product_list,:user_products,:create,:product_update,:product_delete]

  def user_products
    @products = Product.where(user_id: params[:id])
    render json: @products
  end

  def product_list
    @products =  Product.find(params[:id])
    render json: @products
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
      if @product.save
        render json: @product
      else
        render json: "not created"
      end
  end

  def product_update
    @product = Product.find(params[:id])
      if @product.update(product_params)
        render json: @product
      else
        render json: "not created"
      end
  end

  def product_delete
      @product = Product.find(params[:id])
      @product.destroy
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :quantity, :price, :size, :discount, :stock, :selling_price, :color, :gender, :specification, :category, :brand_id, :user_id)
    end
end
