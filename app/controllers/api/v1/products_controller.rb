class Api::V1::ProductsController < ApplicationController

  # Se evita el error (Cant verify CSRF token authenticity)
  # que se genera por el helper form_for y que a su vez genera el token CSRF
  skip_before_filter :verify_authenticity_token

  def index
    render json: Product.all
  end
  
  def create
    product = Product.new(product_params)
    if product.save
      render json: product, status: 201
    else
      render json: { errors: product.errors }, status: 422
    end
  end
  
  private
    def product_params
      params.require(:product).permit(:name, :price)
    end
  
end