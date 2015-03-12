class CartsController < ApplicationController
  before_filter :user_is_current_user
	
	def show
		@cart = current_user.cart
		@items = @cart.items.page(params[:page])
	end

	def clear
		@cart = Cart.find(params[:id])
		@cart.items = []
		@cart.total_cost = 0
		@cart.save
	end

	def new
		@cart = Cart.new
	end

	def create

		user = User.find(params[:user_id])
		product = Product.find(params[:product_id])
		@item = Item.new(user: user, product: product, quantity: params[:quantity], cost: params[:cost])
		@item.save
		@item.product = product
		@item.save
		@cart = Cart.find_or_create_by(user: user)
		if @cart.items.map(&:product).include?(product)
			@cart.items.where(product: product).first.delete
			@cart.items << @item 
		else
			@cart.items << @item
		end
	end

	def edit
		@cart = Cart.find(params[:id])	
		@items = @cart.items.page(params[:page])
	end
	
	def update
	end

	def destroy
	end

  private

  def user_is_current_user
    unless current_user.id.to_s == params[:user_id]
      flash[:danger] = "You may only view your own cart."
      redirect_to root_path
    end
  end

end