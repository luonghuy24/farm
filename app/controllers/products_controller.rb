class ProductsController < ApplicationController
  def index
    if params[:search].nil?
      @products = Product.all.asc(:product_name).page(params[:page])
    else
      @products = Product.all.where(type: params[:search]).asc(:product_name).page(params[:page])
    end
  end

  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:message] = 'Created new product successfully'
      redirect_to products_url
    else
      render 'new'
    end
    # @product = Product.new()
  end

  def edit
    @product = Product.find(params[:id])
  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Product deleted"
    redirect_to products_url
  end

  private
    def product_params
      params.require(:product).permit(:product_name, :product_code, :description, :price)
    end
end