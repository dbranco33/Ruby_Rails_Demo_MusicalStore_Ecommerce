class ProductController < ApplicationController
  def index
    # Load all products.
    @products = Product.order('name').all
    # Load all categories
    @categories = Category.order('name').all
  end

  def show
    # Find the product with the primary key mentioned in the URL.
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.create( user_params )
  end

  private

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.
  def user_params
    params.require(:product).permit(:image)
  end
end
