class LanderController < ApplicationController
  def index
  	@products = Product.all
	end 
end
