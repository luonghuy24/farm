class OrdersController < ApplicationController
	def show
		@order = Order.find(params[:id])
		@items = @order.items.page(params[:page])
	end

	def save
		@order = Order.find(params[:id])
		@order.status = "saved"
		@order.user.cart.items.delete_all
		@order.save
	end

	def index
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