class WelcomeController < ApplicationController
  def index
    # Load all products.
    @products = Product.order('name').page(params[:page]).per(5).all
    # Load all categories
    @categories = Category.order('name').all
  end
end
