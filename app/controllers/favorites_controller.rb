class FavoritesController < ApplicationController
	def index
		@favorites = Favorite.all.page(params[:page])
	end

	def show
		
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

	private
		def favorite_params
      params.require(:favorite).permit(:user_id, :product_id)
		end
end