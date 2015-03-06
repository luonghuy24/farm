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
		user = User.where(email: params[:user_email]).first
		product = Product.find(params[:product_id])
		@fav = Favorite.new(user: user, product: product)
		@fav.save
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		@fav = Favorite.find(params[:id]).delete
	end

end