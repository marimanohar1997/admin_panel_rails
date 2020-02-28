class BrandsController < ApplicationController
   #skip_before_action :verify_authenticity_token
   protect_from_forgery with: :null_session
   before_action :authorize_request, only: [:index,:brand_create,:brand_update,:brand_delete,:brand_list,:set_brand]

  def index
    @brands = Brand.all
    render json: @brands
  end

  def brand_list
    @data = Brand.find(params[:id])
    render json: @data
  end

  def new
    @brand = Brand.new
  end

  def brand_create
    @brand = Brand.new(brand_params)
      if @brand.save
        render json: @brand
      else
        render json: "error"
      end
  end

  def brand_update
     @brand =  Brand.find(params[:id])
      if @brand.update(brand_params)
        render json: @brand
      else
        render json: "Brand not updated"
      end
  end

  def brand_delete
    @brand =  Brand.find(params[:id])
    @brand.products.map {|i| i.delete}
    @brand.destroy
  end

  private
    def set_brand
      @brand = Brand.find(params[:id])
    end

    def brand_params
      params.require(:brand).permit(:name, :brand_type, :description)
    end
end
