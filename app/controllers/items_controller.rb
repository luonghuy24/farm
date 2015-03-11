class ItemsController < ApplicationController
	before_filter :authenticate_user!	
	def destroy
		@item = Item.find(params[:id])
		@item.delete
  end

  def update
  	@item = Item.find(params[:id])
  	@item.quantity = params[:quantity]
  	@item.cost = params[:cost]
  	@item.save
  end
end