class ItemsController < ApplicationController
	before_filter :authenticate_user!	
	def destroy
		@item = Item.find(params[:id])
		@item.delete
  end
end