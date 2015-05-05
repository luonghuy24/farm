class HomeController < ApplicationController
  def index
  end

  def about
		render layout: 'no_layout'  	
  end

  def test
  end
end
