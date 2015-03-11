class FavoritesController < ApplicationController
	def index
		@favorites = Favorite.all.page(params[:page])
	end

	def show
		
	end

	def new
		@fav = Favorite.new
	end

	def create
		user = User.find(params[:user_id])
		product = Product.find(params[:product_id])
		@fav = Favorite.new(user: user, product: product)
		@fav.save
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		product = Product.find(params[:product_id])
		@fav = Favorite.where(user: current_user, product: product).first.delete
	end

end