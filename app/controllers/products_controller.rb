class ProductsController < ApplicationController
  def index
    if params[:search].nil?
      @products = Product.all.asc(:product_name).page(params[:page])
      @type = @products.flat_map(&:type).uniq
      @numbers_type = 99
    else
      @products = Product.all.where(type: params[:search]).asc(:product_name).page(params[:page])
      @type = params[:search]
      @numbers_type = 1
    end
  end

  def show
    @product = Product.find(params[:id])
    @rel_products = Product.full_text_search(@product._keywords, match: :any).limit(8)
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

  def update
    @product = Product.find(params[:id])  
    @product.update_attributes(product_params)
    if @product.save
      flash[:message] = 'Created new product successfully'
      redirect_to products_url
    else
      render 'edit'
    end
  end

  def search
    if params[:keywords].present?
      @products = Product.full_text_search(params[:keywords], match: :any).asc(:product_name)
    else
      @products = []
    end
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