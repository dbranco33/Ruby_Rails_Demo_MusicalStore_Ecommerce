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

  def acoustic_category
    # Find the product with the primary key mentioned in the URL.
    @products = Product.order(name: :asc).where('category_id = ?', 1).all
  end

  def electric_category
    # Find the product with the primary key mentioned in the URL.
    @products = Product.order(name: :asc).where('category_id = ?', 2).all
  end

  def bass_category
    # Find the product with the primary key mentioned in the URL.
    @products = Product.order(name: :asc).where('category_id = ?', 3).all
  end

  def amps_category
    # Find the product with the primary key mentioned in the URL.
    @products = Product.order(name: :asc).where('category_id = ?', 4).all
  end

  def acessory_category
    # Find the product with the primary key mentioned in the URL.
    @products = Product.order(name: :asc).where('category_id = ?', 5).all
  end

  def other_category
    # Find the product with the primary key mentioned in the URL.
    @products = Product.order(name: :asc).where('category_id = ?', 6).all
  end

  def search_results
    @products1 = Product.order(name: :asc).where(
      'name LIKE ?',
      "%#{params[:search_keywords]}%"
    )
    @products2 = Product.order(name: :asc).where(
      'name LIKE ? AND category_id = ?',
      "%#{params[:search_keywords]}%",
      params[:search_category]
    )
  end

  def new_products
    # Find the product with the primary key mentioned in the URL.
    @products = Product.order(name: :asc).where('status = ?', 'new').all
  end

  def sale_products
    # Find the product with the primary key mentioned in the URL.
    @products = Product.order(name: :asc).where('status = ?', 'sale').all
  end

  private

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.
  def user_params
    params.require(:product).permit(:image)
  end
end
