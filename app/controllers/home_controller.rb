class HomeController < ApplicationController
  def index
  end

  def cart
  	user = current_user
  	cart = user.cart
  end
end
