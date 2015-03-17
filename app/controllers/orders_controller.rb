class OrdersController < ApplicationController
	
	def show
		@order = Order.find(params[:id])
		@items = @order.items.page(params[:page])
	end

	def back_to_edit_cart
		@order = Order.find(params[:id])
		redirect_to edit_user_cart_url(current_user, current_user.cart)
	end
	
	def index
		@orders = current_user.orders
	end

	def new
	end
	def create
	end
	def edit
	end
	def update
	end
	def destroy
	end
	
end